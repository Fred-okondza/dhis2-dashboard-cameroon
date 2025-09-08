const axios = require('axios');
require('dotenv').config();

async function testSetup() {
  console.log('🔍 Test de configuration DHIS2...\n');
  
  // Test des variables d'environnement
  console.log('📋 Variables d\'environnement :');
  console.log('- DHIS2_BASE_URL:', process.env.DHIS2_BASE_URL || 'NON DÉFINIE');
  console.log('- PORT:', process.env.PORT || 'NON DÉFINIE');
  console.log('- NODE_ENV:', process.env.NODE_ENV || 'NON DÉFINIE');
  
  // Test de connexion DHIS2
  try {
    const auth = Buffer.from(
      `${process.env.DHIS2_USERNAME}:${process.env.DHIS2_PASSWORD}`
    ).toString('base64');
    
    const response = await axios.get(`${process.env.DHIS2_BASE_URL}/api/me`, {
      headers: {
        'Authorization': `Basic ${auth}`,
        'Accept': 'application/json'
      },
      timeout: 10000
    });
    
    console.log('\n✅ Connexion DHIS2 réussie !');
    console.log('👤 Utilisateur:', response.data.displayName);
    console.log('🏥 Organisation:', response.data.organisationUnits?.[0]?.displayName || 'N/A');
    
  } catch (error) {
    console.error('\n❌ Erreur de connexion DHIS2:');
    console.error('Message:', error.message);
    if (error.response) {
      console.error('Status:', error.response.status);
      console.error('Data:', error.response.data);
    }
  }
}

testSetup();
