# DHIS2 Dashboard - CCOUSP/MINSANTE

Système de dashboards et génération automatique de rapports pour DHIS2.

## Démarrage Rapide

### Backend
```bash
cd backend
npm run test:setup  # Tester la configuration
npm run dev         # Démarrer en mode développement
```

### Frontend
```bash
cd frontend
npm run dev         # Démarrer le serveur de développement
```

## URLs de Développement
- Frontend: http://localhost:5173
- Backend API: http://localhost:5000
- Health Check: http://localhost:5000/api/health

## Configuration
Modifiez les fichiers `.env` dans les dossiers `backend` et `frontend` avec vos paramètres DHIS2.

## Structure du Projet
- `frontend/` - Application React avec Vite
- `backend/` - API Node.js/Express
- `docs/` - Documentation
- `reports/` - Rapports générés

## Développé par
Fred Okondza - Stage CCOUSP/MINSANTE
