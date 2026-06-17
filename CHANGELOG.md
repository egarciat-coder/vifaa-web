# Changelog

Todos los cambios notables de este proyecto se documentan aquí.
Formato basado en [Keep a Changelog](https://keepachangelog.com).
Versioning: [Semantic Versioning](https://semver.org).

---

## [Unreleased]

---

## [1.2.0] — 2026-06-16

### ⚡ Mejoras
- SEO: agrega `meta description`, `robots: index follow` y `canonical` a `https://vifaa.mx/`
- OG tags completos (título, descripción, imagen, locale, site_name) para previsualización en redes sociales y WhatsApp
- Twitter Card `summary_large_image` para preview en X/Twitter
- `preconnect` a Google Fonts para reducir tiempo de carga de tipografías
- Gzip habilitado en Nginx — el HTML de ~442 KB se transfiere comprimido (~80-100 KB)

### 🔧 Técnico
- `robots.txt` agregado y servido por Nginx
- `sitemap.xml` agregado con URL canónica `https://vifaa.mx/`
- `docs/PROJECT.md` creado con arquitectura documentada del proyecto
- Dockerfile limpiado (comentarios eliminados, instrucciones COPY para robots.txt y sitemap.xml)

---

## [1.1.0] — 2026-05-27

### ✨ Nuevas funcionalidades
- Carousel de servicios con 3 tarjetas visibles simultáneamente
- Flechas flotantes izquierda/derecha para navegar el carousel
- Soporte de drag con mouse y swipe táctil en el carousel
- i18n ES/EN — selector de idioma con persistencia en `localStorage`
- Cookie banner con consentimiento persistente
- Animaciones de entrada con `IntersectionObserver`

### 🐛 Correcciones
- Textos de sección "About Us" traducidos al inglés (caption del logo y badge label)
- Carpeta `imagenes/` ahora se copia correctamente al contenedor Nginx

### 🔧 Técnico
- Enterprise UI upgrade: sistema de diseño unificado (navy, cobalt, gold)
- Partículas animadas en canvas del hero
- Efecto parallax en imagen de fondo del hero
- Contadores animados con `IntersectionObserver`
- Menú hamburger para mobile

---

## [1.0.0] — 2026-05-26

### ✨ Nuevas funcionalidades
- Sitio institucional completo: Hero, Servicios, Nosotros, Verificación, Contacto, Footer
- Formulario de contacto conectado a Formspree (`mkoepyrb`)
- Email de contacto configurado como `contacto@vifaa.mx`

### 🔧 Técnico
- Proyecto inicial: HTML5 + CSS3 + JavaScript vanilla, sin frameworks
- Nginx con sistema de templates para `PORT` dinámico en Railway
- Dockerfile configurado para despliegue automático en Railway
- Deploy automático en push a `main`
