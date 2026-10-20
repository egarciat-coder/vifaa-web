---
format: 1
id: CHG-20261020-74aeb3
project: vifaa-web
title: Adopción de estack-git: .estack.conf, hooks v2 y LF
type: improve
branch: improve/chg-20261020-74aeb3-adopcion-estack-git
base: main
base_commit: b9eadd15891d3ccbaae07caa2a34d120eba672a5
status: active
started: 2026-10-20
last_device: wsl-pc
components: [tooling-git]
procesos: []
paths: [.estack.conf, .githooks/, .gitattributes, .gitignore, CHANGELOG.md]
schema: false
migrations: []
env_vars: []
depends_on: []
pr:
---

# CHG-20261020-74aeb3 — Adopción de estack-git: .estack.conf, hooks v2 y LF

> Manifiesto del cambio (ver `workflows/CHANGES.md` de e-stack). Viaja dentro de la rama del cambio:
> quien la descarga en otro equipo recupera aquí el plan, el estado y los pendientes.
> Lo que git ya sabe (publicado, integrado, ahead/behind) NO se escribe aquí.

## Plan aprobado

Adopción de estack-git (mismo plan que hub/common-services en F7), aprobada por el usuario el 2026-10-20
("resuelve todos los pendientes", tras el plan del punto 3).
Tipo `improve` (Engineer → QA), PATCH, entrada en [Unreleased].
- `.estack.conf`: integration=main, production=main, deploy-branches=main (verificado 2026-10-20).
- `.githooks/` v2, `.gitattributes` LF, sello en `.gitignore`.
- La rama del cambio no se publica antes de integrar.
- Integración = push a `main` → auto-deploy a PRODUCCIÓN (sin cambios de código de la app):
  gate de producción propio, requiere confirmación explícita del usuario antes de `integrate publish --prod-confirmed`.
- Retorno: revertir el commit (otro deploy a producción, también con confirmación).

## Estado / handoff

| Rol / paso | Estado | Pruebas y resultado | Equipo | Fecha |
|---|---|---|---|---|

### Pendientes

-

## Cambios concurrentes y estrategia

<salida de `estack-git overlap` y análisis semántico: niveles y orden de integración>

<!-- Para cada N3/N4, una línea con este formato EXACTO, escrita solo después de que el usuario aprobó la
     estrategia (con el plan o de forma puntual). `estack-git integrate check` solo la reconoce así:
- Estrategia aprobada CHG-YYYYMMDD-xxxxxx: <qué se hace: orden de integración, quién re-sincroniza, qué se re-prueba>
-->
