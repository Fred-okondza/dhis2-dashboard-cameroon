const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(helmet());
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:5173'
}));
app.use(morgan('combined'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes de test
app.get('/api/health', (req, res) => {
  res.json({
    status: 'OK',
    message: 'DHIS2 Dashboard API is running',
    timestamp: new Date().toISOString()
  });
});

app.get('/api/dhis2/test', async (req, res) => {
  try {
    const axios = require('axios');
    const auth = Buffer.from(`${process.env.DHIS2_USERNAME}:${process.env.DHIS2_PASSWORD}`).toString('base64');
    
    const response = await axios.get(`${process.env.DHIS2_BASE_URL}/api/me`, {
      headers: {
        'Authorization': `Basic ${auth}`,
        'Accept': 'application/json'
      }
    });
    
    res.json({
      status: 'success',
      user: response.data.displayName,
      organization: response.data.organisationUnits?.[0]?.displayName
    });
  } catch (error) {
    res.status(500).json({
      status: 'error',
      message: error.message
    });
  }
});

// Démarrer le serveur
app.listen(PORT, () => {
  console.log(`🚀 Serveur démarré sur http://localhost:${PORT}`);
  console.log(`📊 API Health: http://localhost:${PORT}/api/health`);
  console.log(`🔗 Test DHIS2: http://localhost:${PORT}/api/dhis2/test`);
});
