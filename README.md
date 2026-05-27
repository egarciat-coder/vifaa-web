# VIFAA Logistics — Sitio Web Oficial

Sitio web institucional de VIFAA Red Logística.

## Estructura del proyecto

```
vifaa-web/
├── index.html    → Página web completa (una sola página)
├── Dockerfile    → Configuración para despliegue en Railway
└── README.md     → Este archivo
```

## Tecnologías

- **HTML / CSS / JavaScript** — Sin frameworks, todo en un solo archivo
- **Nginx** — Servidor web (Railway lo maneja automáticamente)
- **Railway** — Plataforma de hosting

## Cómo hacer cambios

1. Abre `index.html` en VS Code
2. Edita el texto, colores o secciones que necesites
3. Guarda el archivo
4. Haz commit y push a GitHub — Railway actualiza el sitio automáticamente

## Despliegue en Railway

1. Conecta este repositorio en [railway.app](https://railway.app)
2. Railway detecta el Dockerfile automáticamente
3. El sitio queda publicado en una URL tipo `vifaa-web.up.railway.app`
4. Puedes conectar tu dominio `vifaa.mx` desde el panel de Railway

## Contacto técnico

Para modificaciones al sitio: editar `index.html` directamente en VS Code
o con ayuda de Claude Code desde la terminal.

---
© 2026 VIFAA Logistics S.A. de C.V.
