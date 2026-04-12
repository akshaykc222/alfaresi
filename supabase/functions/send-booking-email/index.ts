// Deno runtime
import { serve } from "https://deno.land/std@0.224.0/http/server.ts";

serve(async (req: Request) => {
  if (req.method !== "POST") {
    return new Response("Method not allowed", { status: 405 });
  }

  try {
    const { to, subject, data } = await req.json();

    const RESEND_API_KEY = Deno.env.get("RESEND_API_KEY");
    if (!RESEND_API_KEY) {
      return new Response("Missing RESEND_API_KEY", { status: 500 });
    }

    const html = `
      <div style="font-family: Arial, sans-serif; padding: 20px;">
        <h2>New Booking Request</h2>
        <p><b>Name:</b> ${data?.name ?? ""}</p>
        <p><b>Email:</b> ${data?.email ?? ""}</p>
        <p><b>Phone:</b> ${data?.phone ?? ""}</p>
        <p><b>Consultation Type:</b> ${data?.consultation_type ?? ""}</p>
        <p><b>Date:</b> ${data?.date ?? ""}</p>
        <p><b>Time:</b> ${data?.time ?? ""}</p>
      </div>
    `;

    const resp = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${RESEND_API_KEY}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        from: "Alfaresi <onboarding@resend.dev>",
        to: [to ?? "Info@alfaresi.co"],
        subject: subject ?? "New Booking Request",
        html,
      }),
    });

    const body = await resp.text();

    if (!resp.ok) {
      return new Response(`Resend error: ${body}`, { status: 500 });
    }

    return new Response(body, { status: 200 });
  } catch (e) {
    return new Response(`Error: ${e}`, { status: 500 });
  }
});

