#!/bin/bash

# Script pour remplir les fichiers JSON mock
echo "🚀 Remplissage des fichiers mock data..."

# 1. organizational-units.json
cat > mock-data/organizational-units.json << 'EOF'
{
  "organisationUnits": [
    {
      "id": "CM",
      "name": "Cameroun",
      "level": 1,
      "path": "/CM",
      "parent": null,
      "children": [
        {
          "id": "CM_CE",
          "name": "Région du Centre",
          "level": 2,
          "path": "/CM/CM_CE",
          "parent": "CM",
          "children": [
            {
              "id": "CM_CE_YDE",
              "name": "District de Santé de Yaoundé",
              "level": 3,
              "path": "/CM/CM_CE/CM_CE_YDE",
              "parent": "CM_CE",
              "children": [
                {
                  "id": "CM_CE_YDE_HCY",
                  "name": "Hôpital Central de Yaoundé",
                  "level": 4,
                  "path": "/CM/CM_CE/CM_CE_YDE/CM_CE_YDE_HCY",
                  "parent": "CM_CE_YDE",
                  "facilityType": "Hospital",
                  "coordinates": {
                    "latitude": 3.8480,
                    "longitude": 11.5021
                  }
                },
                {
                  "id": "CM_CE_YDE_CSI_MVG",
                  "name": "CSI Mvog-Mbi",
                  "level": 4,
                  "path": "/CM/CM_CE/CM_CE_YDE/CM_CE_YDE_CSI_MVG",
                  "parent": "CM_CE_YDE",
                  "facilityType": "Health Center",
                  "coordinates": {
                    "latitude": 3.8667,
                    "longitude": 11.5167
                  }
                }
              ]
            }
          ]
        },
        {
          "id": "CM_LT",
          "name": "Région du Littoral",
          "level": 2,
          "path": "/CM/CM_LT",
          "parent": "CM",
          "children": [
            {
              "id": "CM_LT_DLA",
              "name": "District de Santé de Douala",
              "level": 3,
              "path": "/CM/CM_LT/CM_LT_DLA",
              "parent": "CM_LT",
              "children": [
                {
                  "id": "CM_LT_DLA_HGD",
                  "name": "Hôpital Général de Douala",
                  "level": 4,
                  "path": "/CM/CM_LT/CM_LT_DLA/CM_LT_DLA_HGD",
                  "parent": "CM_LT_DLA",
                  "facilityType": "Hospital",
                  "coordinates": {
                    "latitude": 4.0511,
                    "longitude": 9.7679
                  }
                }
              ]
            }
          ]
        }
      ]
    }
  ],
  "metadata": {
    "levels": [
      {"level": 1, "name": "National"},
      {"level": 2, "name": "Région"},
      {"level": 3, "name": "District de Santé"},
      {"level": 4, "name": "Formation Sanitaire"}
    ],
    "facilityTypes": [
      {"id": "Hospital", "name": "Hôpital"},
      {"id": "Health Center", "name": "Centre de Santé Intégré"},
      {"id": "Clinic", "name": "Clinique"},
      {"id": "Dispensary", "name": "Dispensaire"}
    ]
  }
}
EOF

# 2. indicators.json
cat > mock-data/indicators.json << 'EOF'
{
  "dataElements": [
    {
      "id": "DE_MAL_CASES",
      "name": "Cas de paludisme confirmés",
      "shortName": "Paludisme confirmé",
      "code": "MAL_CONFIRMED",
      "valueType": "INTEGER",
      "aggregationType": "SUM",
      "categoryCombo": "default"
    },
    {
      "id": "DE_VAC_BCG",
      "name": "Vaccinations BCG administrées",
      "shortName": "Vaccination BCG",
      "code": "VAC_BCG",
      "valueType": "INTEGER",
      "aggregationType": "SUM"
    },
    {
      "id": "DE_MAT_DEATHS",
      "name": "Décès maternels",
      "shortName": "Décès maternels",
      "code": "MAT_DEATHS",
      "valueType": "INTEGER",
      "aggregationType": "SUM"
    },
    {
      "id": "DE_COVID_CASES",
      "name": "Cas de COVID-19 confirmés",
      "shortName": "COVID-19 confirmé",
      "code": "COVID_CONFIRMED",
      "valueType": "INTEGER",
      "aggregationType": "SUM"
    }
  ],
  "indicators": [
    {
      "id": "IND_MAL_INCIDENCE",
      "name": "Incidence du paludisme pour 1000 habitants",
      "shortName": "Incidence paludisme",
      "indicatorType": "Rate",
      "numerator": "DE_MAL_CASES",
      "denominator": "Population",
      "factor": 1000,
      "description": "Nombre de cas de paludisme confirmés pour 1000 habitants"
    },
    {
      "id": "IND_VAC_COVERAGE",
      "name": "Couverture vaccinale BCG",
      "shortName": "Couverture BCG",
      "indicatorType": "Percentage",
      "numerator": "DE_VAC_BCG",
      "denominator": "Population cible < 1 an",
      "factor": 100,
      "description": "Pourcentage d'enfants < 1 an vaccinés avec BCG"
    },
    {
      "id": "IND_MAT_MORTALITY",
      "name": "Ratio de mortalité maternelle",
      "shortName": "Mortalité maternelle",
      "indicatorType": "Rate",
      "numerator": "DE_MAT_DEATHS",
      "denominator": "Naissances vivantes",
      "factor": 100000,
      "description": "Nombre de décès maternels pour 100 000 naissances vivantes"
    }
  ],
  "programs": [
    {
      "id": "PROG_MALARIA",
      "name": "Programme National de Lutte contre le Paludisme",
      "shortName": "PNLP",
      "indicators": ["IND_MAL_INCIDENCE"],
      "dataElements": ["DE_MAL_CASES"]
    },
    {
      "id": "PROG_VACCINATION",
      "name": "Programme Élargi de Vaccination",
      "shortName": "PEV",
      "indicators": ["IND_VAC_COVERAGE"],
      "dataElements": ["DE_VAC_BCG"]
    },
    {
      "id": "PROG_MATERNAL",
      "name": "Programme de Santé Maternelle",
      "shortName": "SMI",
      "indicators": ["IND_MAT_MORTALITY"],
      "dataElements": ["DE_MAT_DEATHS"]
    },
    {
      "id": "PROG_COVID19",
      "name": "Riposte COVID-19",
      "shortName": "COVID-19",
      "indicators": [],
      "dataElements": ["DE_COVID_CASES"]
    }
  ]
}
EOF

# 3. periods.json
cat > mock-data/periods.json << 'EOF'
{
  "periods": [
    {"id": "2022", "name": "2022", "periodType": "Yearly", "startDate": "2022-01-01", "endDate": "2022-12-31"},
    {"id": "2023", "name": "2023", "periodType": "Yearly", "startDate": "2023-01-01", "endDate": "2023-12-31"},
    {"id": "2024", "name": "2024", "periodType": "Yearly", "startDate": "2024-01-01", "endDate": "2024-12-31"},
    {"id": "2024Q1", "name": "Q1 2024", "periodType": "Quarterly", "startDate": "2024-01-01", "endDate": "2024-03-31"},
    {"id": "2024Q2", "name": "Q2 2024", "periodType": "Quarterly", "startDate": "2024-04-01", "endDate": "2024-06-30"},
    {"id": "202401", "name": "Janvier 2024", "periodType": "Monthly", "startDate": "2024-01-01", "endDate": "2024-01-31"},
    {"id": "202402", "name": "Février 2024", "periodType": "Monthly", "startDate": "2024-02-01", "endDate": "2024-02-29"},
    {"id": "202403", "name": "Mars 2024", "periodType": "Monthly", "startDate": "2024-03-01", "endDate": "2024-03-31"},
    {"id": "202404", "name": "Avril 2024", "periodType": "Monthly", "startDate": "2024-04-01", "endDate": "2024-04-30"},
    {"id": "202405", "name": "Mai 2024", "periodType": "Monthly", "startDate": "2024-05-01", "endDate": "2024-05-31"},
    {"id": "202406", "name": "Juin 2024", "periodType": "Monthly", "startDate": "2024-06-01", "endDate": "2024-06-30"}
  ]
}
EOF

# 4. users.json
cat > mock-data/users.json << 'EOF'
{
  "users": [
    {
      "id": "user_admin",
      "username": "admin.minsante",
      "firstName": "Administrateur",
      "lastName": "MINSANTE",
      "email": "admin@minsante.cm",
      "organisationUnits": ["CM"],
      "userRoles": [
        {
          "id": "role_admin",
          "name": "Administrateur Système",
          "authorities": ["ALL"]
        }
      ]
    },
    {
      "id": "user_regional",
      "username": "coord.centre",
      "firstName": "Coordonnateur",
      "lastName": "Région Centre",
      "email": "coord.centre@minsante.cm",
      "organisationUnits": ["CM_CE"],
      "userRoles": [
        {
          "id": "role_regional",
          "name": "Coordonnateur Régional",
          "authorities": ["VIEW_REGIONAL_DATA", "GENERATE_REPORTS"]
        }
      ]
    }
  ]
}
EOF

# 5. analytics-data.json
cat > mock-data/analytics-data.json << 'EOF'
{
  "analyticsData": {
    "headers": ["dx", "ou", "pe", "value"],
    "metaData": {
      "dimensions": {
        "dx": ["DE_MAL_CASES", "DE_VAC_BCG", "DE_MAT_DEATHS", "DE_COVID_CASES"],
        "ou": ["CM_CE_YDE", "CM_LT_DLA", "CM_CE_YDE_HCY", "CM_CE_YDE_CSI_MVG"],
        "pe": ["202401", "202402", "202403", "202404", "202405", "202406"]
      }
    },
    "rows": [
      ["DE_MAL_CASES", "CM_CE_YDE", "202401", 1245],
      ["DE_MAL_CASES", "CM_CE_YDE", "202402", 1189],
      ["DE_MAL_CASES", "CM_CE_YDE", "202403", 1356],
      ["DE_MAL_CASES", "CM_CE_YDE", "202404", 1423],
      ["DE_MAL_CASES", "CM_CE_YDE", "202405", 1598],
      ["DE_MAL_CASES", "CM_CE_YDE", "202406", 1672],
      ["DE_VAC_BCG", "CM_CE_YDE", "202401", 456],
      ["DE_VAC_BCG", "CM_CE_YDE", "202402", 489],
      ["DE_VAC_BCG", "CM_CE_YDE", "202403", 512],
      ["DE_VAC_BCG", "CM_CE_YDE", "202404", 534],
      ["DE_VAC_BCG", "CM_CE_YDE", "202405", 567],
      ["DE_VAC_BCG", "CM_CE_YDE", "202406", 591],
      ["DE_MAT_DEATHS", "CM_CE_YDE", "202401", 3],
      ["DE_MAT_DEATHS", "CM_CE_YDE", "202402", 2],
      ["DE_MAT_DEATHS", "CM_CE_YDE", "202403", 4],
      ["DE_COVID_CASES", "CM_CE_YDE", "202401", 45],
      ["DE_COVID_CASES", "CM_CE_YDE", "202402", 32],
      ["DE_COVID_CASES", "CM_CE_YDE", "202403", 28]
    ]
  }
}
EOF

echo "✅ Fichier organizational-units.json créé"
echo "✅ Fichier indicators.json créé"
echo "✅ Fichier periods.json créé"
echo "✅ Fichier users.json créé"
echo "✅ Fichier analytics-data.json créé"

# Copier dans public/mock-data pour React
cp -r mock-data/* public/mock-data/
echo "✅ Fichiers copiés dans public/mock-data/"

echo ""
echo "🎉 Tous les fichiers mock data ont été créés avec succès !"
echo ""
echo "Vérification :"
wc -l mock-data/*.json
echo ""
echo "📂 Structure finale :"
tree mock-data/

