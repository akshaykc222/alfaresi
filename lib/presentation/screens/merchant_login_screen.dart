import 'package:alfaresi/l10n/l10n.dart';
import 'package:alfaresi/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MerchantLoginScreen extends StatefulWidget {
  const MerchantLoginScreen({super.key});

  @override
  State<MerchantLoginScreen> createState() => _MerchantLoginScreenState();
}

class _MerchantLoginScreenState extends State<MerchantLoginScreen> {
  WebViewController? _controller;
  bool _isLoading = true;
  String? _errorMessage;
  late final String _viewKey;

  @override
  void initState() {
    super.initState();
    _viewKey = 'merchant_login_${DateTime.now().millisecondsSinceEpoch}';
    _initializeController();
  }

  void _initializeController() {
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                if (mounted) {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                  // Hide body immediately to prevent showing full site
                  _controller?.runJavaScript('''
                    (function() {
                      // Inject CSS immediately to hide everything
                      var hideStyle = document.createElement('style');
                      hideStyle.id = 'initial-hide-style';
                      hideStyle.innerHTML = 'body { display: none !important; visibility: hidden !important; } html { visibility: hidden !important; }';
                      if (document.head) {
                        document.head.appendChild(hideStyle);
                      } else {
                        document.addEventListener('DOMContentLoaded', function() {
                          document.head.appendChild(hideStyle);
                        });
                      }
                    })();
                  ''');
                }
              },
              onPageFinished: (String url) {
                // Hide everything except login form and enable zoom
                _controller?.runJavaScript('''
                (function() {
                  // Set viewport for zoom
                  var meta = document.querySelector('meta[name="viewport"]');
                  if (!meta) {
                    meta = document.createElement('meta');
                    meta.name = 'viewport';
                    document.getElementsByTagName('head')[0].appendChild(meta);
                  }
                  meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes';
                  
                  // Remove initial hide style and show body
                  var hideStyle = document.getElementById('initial-hide-style');
                  if (hideStyle) {
                    hideStyle.remove();
                  }
                  
                  // Wait a bit for page to fully load before showing
                  setTimeout(function() {
                    // Hide unwanted text elements and style error messages
                    function hideTextElements() {
                      // Hide all paragraphs, headings, and links
                      var allElements = document.querySelectorAll('p, h1, h2, h3, h4, h5, h6, a, span, div, td, th');
                      allElements.forEach(function(el) {
                        var text = el.textContent || el.innerText || '';
                        // Style error messages in red container
                        if (text.includes('Access denied') ||
                            text.includes('Invalid') ||
                            text.includes('Error') ||
                            text.includes('Failed') ||
                            text.includes('denied') ||
                            text.toLowerCase().includes('incorrect')) {
                          el.style.display = 'block';
                          el.style.background = '#ffebee';
                          el.style.color = '#c62828';
                          el.style.padding = '12px';
                          el.style.margin = '10px 0';
                          el.style.borderRadius = '4px';
                          el.style.border = '1px solid #ef5350';
                          el.style.fontWeight = 'bold';
                          el.style.textAlign = 'center';
                        }
                        // Hide if it contains unwanted text
                        else if (text.includes('To better serve') ||
                            text.includes("I'm an agent") ||
                            text.includes('sign in here') ||
                            text.includes('first time contacting') ||
                            text.includes('lost the ticket') ||
                            text.includes('open a new ticket') ||
                            text.includes('Sign in to AlFaresi') ||
                            text.includes('Copyright') ||
                            text.includes('SupportSystem')) {
                          el.style.display = 'none';
                        }
                        // Hide if it's a link and not part of form
                        else if (el.tagName === 'A' && !el.closest('form')) {
                          el.style.display = 'none';
                        }
                      });
                      
                      // Hide all paragraphs and headings that don't contain inputs or error messages
                      document.querySelectorAll('p, h1, h2, h3, h4, h5, h6').forEach(function(el) {
                        var text = el.textContent || el.innerText || '';
                        if (!el.querySelector('input') && 
                            !el.querySelector('button') &&
                            !text.includes('Access denied') &&
                            !text.includes('Invalid') &&
                            !text.includes('Error') &&
                            !text.includes('Failed') &&
                            !text.includes('denied') &&
                            !text.toLowerCase().includes('incorrect')) {
                          el.style.display = 'none';
                        }
                      });
                    }
                    
                    // Inject CSS to hide navigation and style form
                    var style = document.createElement('style');
                    style.innerHTML = `
                      /* Hide navigation, headers, footers */
                      nav, header:not(form header), footer,
                      .navbar, .nav, .navigation, .topnav,
                      .support-nav, .top-bar, .bottom-bar,
                      .footer, .copyright, .powered-by,
                      .breadcrumb, .menu, .sidebar,
                      table:first-of-type, tr:first-child {
                        display: none !important;
                      }
                      
                      /* Hide elements with navigation-related classes/IDs */
                      [class*="nav"]:not([class*="login"]),
                      [class*="menu"]:not([class*="login"]),
                      [class*="header"]:not([class*="login"]),
                      [class*="footer"],
                      [id*="nav"]:not([id*="login"]),
                      [id*="menu"]:not([id*="login"]),
                      [id*="header"]:not([id*="login"]),
                      [id*="footer"] {
                        display: none !important;
                      }
                      
                      /* Style body - transparent background with rounded top edges */
                      body, html {
                        padding: 20px !important;
                        margin: 0 !important;
                        background: transparent !important;
                        display: flex !important;
                        justify-content: center !important;
                        align-items: center !important;
                        min-height: 100vh !important;
                        border-top-left-radius: 20px !important;
                        border-top-right-radius: 20px !important;
                        overflow: hidden !important;
                      }
                      
                      /* Remove all white backgrounds and shadows from containers (except inputs) */
                      *:not(input):not(button) {
                        background: transparent !important;
                        box-shadow: none !important;
                      }
                      
                      /* Remove borders from containers */
                      div, form, section, article, main, table, tr, td {
                        border: none !important;
                      }
                      
                      /* Hide all table cells and rows that create stacked effect */
                      table, tr, td {
                        background: transparent !important;
                        border: none !important;
                        display: block !important;
                        padding: 0 !important;
                        margin: 0 !important;
                      }
                      
                      /* Remove backgrounds from divs and containers */
                      div, form, section, article, main {
                        background: transparent !important;
                        box-shadow: none !important;
                        border: none !important;
                        padding: 0 !important;
                        margin: 0 !important;
                      }
                      
                      /* Center the form inputs directly */
                      form, .login-form, .signin-form,
                      [class*="login"]:not([class*="nav"]),
                      [class*="signin"]:not([class*="nav"]),
                      [id*="login"]:not([id*="nav"]),
                      [id*="signin"]:not([id*="nav"]),
                      table:has(input[type="password"]),
                      div:has(input[type="password"]) {
                        max-width: 400px !important;
                        width: 100% !important;
                        margin: 0 auto !important;
                        padding: 0 !important;
                        background: transparent !important;
                        border-radius: 0 !important;
                        box-shadow: none !important;
                        display: block !important;
                      }
                      
                      /* Hide all headings */
                      h1, h2, h3, h4, h5, h6 {
                        display: none !important;
                      }
                      
                      /* Style error messages in red container */
                      *:contains("Access denied"),
                      *:contains("Invalid"),
                      *:contains("Error"),
                      *:contains("Failed"),
                      *:contains("denied"),
                      div:has-text("Access denied"),
                      div:has-text("Invalid"),
                      p:has-text("Access denied"),
                      p:has-text("Invalid"),
                      span:has-text("Access denied"),
                      span:has-text("Invalid") {
                        display: block !important;
                        background: #ffebee !important;
                        color: #c62828 !important;
                        padding: 12px !important;
                        margin: 10px 0 !important;
                        border-radius: 4px !important;
                        border: 1px solid #ef5350 !important;
                        font-weight: bold !important;
                        text-align: center !important;
                      }
                      
                      /* Hide paragraphs and links outside form (except error messages) */
                      form ~ p:not(:contains("Access denied")):not(:contains("Invalid")):not(:contains("Error")),
                      form ~ a, form ~ div:not(:has(input)),
                      body > p:not(:contains("Access denied")):not(:contains("Invalid")):not(:contains("Error")),
                      body > a {
                        display: none !important;
                      }
                      
                      /* Style form inputs - add white background only to inputs */
                      input[type="text"], input[type="email"],
                      input[type="password"], input[type="username"] {
                        width: 100% !important;
                        padding: 12px !important;
                        margin: 10px 0 !important;
                        border: 1px solid #ddd !important;
                        border-radius: 4px !important;
                        box-sizing: border-box !important;
                        display: block !important;
                        background: white !important;
                      }
                      
                      /* Style submit button */
                      button[type="submit"], input[type="submit"] {
                        width: 100% !important;
                        padding: 12px !important;
                        margin: 15px 0 !important;
                        background: #000 !important;
                        color: white !important;
                        border: none !important;
                        border-radius: 4px !important;
                        cursor: pointer !important;
                        display: block !important;
                      }
                    `;
                    document.head.appendChild(style);
                    
                    // Hide text elements
                    hideTextElements();
                    
                    // Also hide on any DOM changes
                    var observer = new MutationObserver(hideTextElements);
                    observer.observe(document.body, {
                      childList: true,
                      subtree: true
                    });
                  }, 1000);
                  
                  // Also enable zoom gestures
                  document.addEventListener('gesturestart', function(e) {
                    e.preventDefault();
                  });
                })();
              ''');

                // Hide loader after cleanup completes (1000ms timeout + buffer)
                Future.delayed(const Duration(milliseconds: 1200), () {
                  if (mounted) {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                });
              },
              onWebResourceError: (WebResourceError error) {
                if (mounted) {
                  setState(() {
                    _isLoading = false;
                    _errorMessage =
                        error.description.isNotEmpty
                            ? error.description
                            : 'Failed to load page. Please check your internet connection.';
                  });
                }
              },
            ),
          )
          ..loadRequest(
            Uri.parse('https://alfaresi.supportsystem.com/login.php'),
          );
  }

  @override
  void dispose() {
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Custom header with back button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go(GRoutePartner.path);
                      }
                    },
                  ),
                  Expanded(
                    child: Text(
                      l10n.merchantLogin,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48), // Balance the back button
                ],
              ),
            ),
            // WebView or Error display
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                child: Stack(
                  children: [
                    if (_errorMessage == null &&
                        _controller != null &&
                        !_isLoading)
                      WebViewWidget(
                        key: ValueKey(_viewKey),
                        controller: _controller!,
                      )
                    else if (_errorMessage != null)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                size: 64,
                                color: Colors.red,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Error Loading Page',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _errorMessage!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _errorMessage = null;
                                    _isLoading = true;
                                  });
                                  _controller?.reload();
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (_isLoading && _errorMessage == null)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
