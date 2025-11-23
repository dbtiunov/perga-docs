---
sidebar_position: 3
---

# Perga Web

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Build](https://github.com/dbtiunov/perga-web/actions/workflows/ci.yml/badge.svg)

The web client for the Perga personal organizer system. It connects to the [Perga API](./perga-api) and provides a responsive, accessible interface for daily planning and monthly agendas.

## Overview

Perga Web is a standalone SPA built with React and Vite. It communicates with Perga API using a configurable base URL and implements authentication, planner views, and user settings fully in the browser.

## Features

- Daily planner
- Monthly and custom agendas
- User authentication and settings
- Responsive design with mobile support
- Dark theme

## Demo

Try the hosted demo:
- https://demo.getperga.me/

## Tech Stack

- React 19
- TypeScript (~5.7)
- Vite 6
- Tailwind CSS 4
- React Router 7
- Axios 1

## Requirements

- Node.js 20+ (Docker uses `node:20-alpine`)
- npm 8+ (project uses npm; a `package-lock.json` is included)

## Environment variables

Create a `.env` file from the example and adjust values as needed:
```bash
cp .env.example .env
```
Available variables:
- `VITE_API_BASE_URL` — Base URL of Perga API (example: `http://127.0.0.1:8080/api/v1`)
- `VITE_IS_SIGNUP_DISABLED` — When `true`, hides/disables the Signup option in the UI

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/dbtiunov/perga-web.git
   cd perga-web
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Configure environment:
   ```bash
   cp .env.example .env
   # then edit .env
   ```

## Development

Start the Vite development server (defaults to http://localhost:5173):
```bash
npm run dev
```

Code quality:
```bash
npm run lint
npm run format       # write
npm run format:check # check only
```

## Build & Preview

Build production assets (TypeScript build + Vite build):
```bash
npm run build
```

Preview the production build locally:
```bash
npm run preview
```

The build output is written to the `dist/` directory.

## Docker

The app can be built and served by nginx using Docker Compose.

```bash
# Build and start
docker-compose up -d

# Stop
docker-compose down
```

Defaults:
- Container serves on port 80 via nginx
- Host is mapped to http://localhost:3000 (compose maps `3000:80`)
- `VITE_API_BASE_URL` is passed as a build ARG and from `.env` (compose uses `env_file: .env`)

Health endpoint (inside container): `GET /health/` → `200 ok`

## Project Structure

```
perga-web/
├── src/                  # Source code
│   ├── api/              # API clients & types
│   ├── assets/           # Static assets
│   ├── common/           # Shared UI/components/utils
│   ├── contexts/         # React contexts
│   ├── sections/         # Main application sections
│   │   ├── auth/         # Authentication components
│   │   ├── planner/      # Planning functionality
│   │   └── settings/     # User settings
│   ├── App.tsx           # Main application component
│   └── main.tsx          # Application entry point
├── public/               # Public assets
├── .env.example          # Example environment variables
├── docker-compose.yml    # Docker Compose configuration
├── Dockerfile            # Multi-stage build (Node 20) + nginx runner
├── nginx/nginx.conf      # nginx config for SPA
├── index.html            # HTML entry point
├── package.json          # Scripts and dependencies
├── tsconfig.json         # TypeScript project references
└── vite.config.ts        # Vite configuration and path aliases
```

## Path Aliases

The project uses path aliases (defined in `vite.config.ts`) to simplify imports:

- `@` → `src`
- `@api` → `src/api`
- `@assets` → `src/assets`
- `@common` → `src/common`
- `@contexts` → `src/contexts`
- `@sections` → `src/sections`
- `@auth` → `src/sections/auth`
- `@planner` → `src/sections/planner`
- `@settings` → `src/sections/settings`

## CI

GitHub Actions workflow: `.github/workflows/ci.yml`

Badge: ![Build](https://github.com/dbtiunov/perga-web/actions/workflows/ci.yml/badge.svg)

## Troubleshooting

- CORS: ensure `VITE_API_BASE_URL` points to the correct API and that CORS is enabled by the API.
- Signup hidden: set `VITE_IS_SIGNUP_DISABLED=false` (or omit) to show the Signup link.
- Blank page in production: verify nginx serves `index.html` for SPA routes (configured via `try_files` in `nginx.conf`).

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/dbtiunov/perga-web/blob/main/LICENSE) file for details.
