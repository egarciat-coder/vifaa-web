# VIFAA Logistics — Arquitectura del Proyecto

## Tipo de proyecto

Sitio institucional estático (landing page). Sin backend, sin base de datos, sin autenticación.

## Stack

| Capa | Tecnología |
|------|-----------|
| Markup / Estilos / Lógica | HTML5 + CSS3 + JavaScript vanilla |
| Servidor | Nginx (Alpine) |
| Contenedor | Docker |
| Hosting | Railway (auto-deploy en push a `main`) |
| Dominio | vifaa.mx |

## Diagrama

```
[Navegador]
    ↓ HTTPS (Railway termina TLS)
[Nginx:alpine — Docker en Railway]
    ├── index.html  (~442 KB — todo el sitio en un archivo)
    └── imagenes/   (8 imágenes de servicios)
         ↓
[Formspree]   ← formulario de contacto (ID: mkoepyrb)
[Google Fonts CDN]
[Unsplash CDN] ← imagen hero
```

## Secciones del sitio

| Sección | ID | Descripción |
|---------|----|-------------|
| Hero | `#inicio` | Título + CTA + partículas animadas + parallax |
| Servicios | `#servicios` | Carousel de 8 servicios (drag/touch) |
| Nosotros | `#nosotros` | About Us + stats animados |
| Programa | `#verificacion` | Programa de verificación |
| Contacto | `#contacto` | Formulario → Formspree |
| Footer | — | Links + copyright |

## Funcionalidades JavaScript

- **i18n ES/EN** — `data-i18n` attributes + `localStorage('vifaa_lang')`
- **Cookie consent** — banner + `localStorage('vifaa_cookies')`
- **Carousel** — mouse drag + touch swipe, 3 cards visibles, flechas flotantes
- **Partículas** — canvas animado en el hero
- **Parallax** — fondo del hero con `requestAnimationFrame`
- **Animaciones** — `IntersectionObserver` para fade-in
- **Contadores** — animación de números al hacer scroll
- **Hamburger menu** — navegación mobile

## Integraciones externas

| Servicio | Uso | Plan |
|----------|-----|------|
| Formspree | Formulario de contacto | Gratuito (50 envíos/mes) |
| Google Fonts | Tipografías (Montserrat, Inter, JetBrains Mono) | Gratuito |
| Unsplash CDN | Imagen hero | Gratuito |
| Railway | Hosting + deploy | Pago |

## Despliegue

1. Push a `main` en GitHub
2. Railway detecta el cambio y rebuilda el Docker image
3. Nginx sirve los archivos estáticos
4. Railway maneja TLS / HTTPS automáticamente

## Variables de entorno

| Variable | Valor por defecto | Descripción |
|----------|------------------|-------------|
| `PORT` | `8080` | Puerto que escucha Nginx (Railway lo inyecta) |

## Riesgos conocidos

| Riesgo | Severidad | Mitigación |
|--------|-----------|------------|
| `index.html` monolítico (442 KB) | Media | Aceptable mientras no crezca; refactorizar si supera ~600 KB |
| Formspree ID expuesto | Baja | Activar domain restriction en Formspree dashboard |
| Imagen hero de Unsplash CDN | Baja | Reemplazar con imagen propia si Unsplash cambia la URL |
| Sin analytics | Baja | Agregar GA4 o Plausible si se necesitan métricas |

## Historial de decisiones

```
DECISIÓN: HTML/CSS/JS vanilla (sin framework)
RAZÓN: Landing institucional; React/Next.js sería overkill para contenido estático
ALTERNATIVA DESCARTADA: Next.js — costo de complejidad no justificado
RIESGO: Monolito difícil de mantener al crecer

DECISIÓN: Formspree para el formulario de contacto
RAZÓN: Zero backend, integración en minutos
ALTERNATIVA DESCARTADA: Resend requeriría un endpoint Node.js
RIESGO: Límite de 50 envíos/mes en plan gratuito

DECISIÓN: Nginx en Railway
RAZÓN: Simple, confiable, bajo costo para sitio estático
ALTERNATIVA DESCARTADA: Vercel/Netlify — sin ventaja real para este caso
RIESGO: Ninguno significativo
```

---

_Última actualización: 2026-06-16_
