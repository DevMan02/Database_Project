# Database Project - Basi di Dati

Progetto universitario per il corso di Basi di Dati che implementa un database relazionale PostgreSQL per la gestione di informazioni geografiche su nazioni, corsi d'acqua, laghi e mari.

## 📋 Contenuto del Repository

- **db.sql**: Schema del database PostgreSQL con tabelle, vincoli e trigger
- **ProgettoBasi_Analisi.Rmd**: Script R Markdown per l'analisi e popolamento del database
- **Contenuto tabelle.xlsx**: File Excel con i dati da importare nelle tabelle
- **Relazione_Basi_Di_Dati.pdf**: Documentazione completa del progetto

## 🗄️ Struttura del Database

Il database modella le seguenti entità:

- **Nazione**: informazioni su nazioni (capitale, superficie, popolazione)
- **Corso d'Acqua**: fiumi con tipologia, lunghezza e relazioni con mari/laghi
- **Lago**: laghi con profondità e superficie
- **Mare**: mari
- **Attraversa**: relazione fiume-nazione con lunghezza del tratto
- **Bagna**: relazione lago-nazione con superficie bagnata
- **Confina**: relazione di confine tra nazioni

Include trigger e vincoli per garantire l'integrità referenziale.

## 🚀 Come Replicare

### Prerequisiti
- PostgreSQL 9.x o superiore
- R e RStudio (per analisi dati)
- Librerie R: `RPostgres`, `DBI`, `dplyr`, `readxl`, `ggplot2`

### Setup Database

1. **Creare il database PostgreSQL**:
```bash
psql -U postgres
CREATE DATABASE postgres;
```

2. **Importare lo schema**:
```bash
cd "Progetto Basi Di Dati"
psql -U postgres -d postgres -f db.sql
```

3. **Configurare le credenziali**: Modificare in `ProgettoBasi_Analisi.Rmd`:
```r
con <- dbConnect(RPostgres::Postgres(),
                 dbname="postgres",
                 host="localhost",
                 port=5432,
                 user="postgres",
                 password="TUA_PASSWORD")
```

4. **Popolare il database**: Aprire `ProgettoBasi_Analisi.Rmd` in RStudio ed eseguire i chunk per importare i dati da `Contenuto tabelle.xlsx`

## 👥 Autori

Luca Deano, Devin Mancardi, Gianfranco Mauro, Davide Volpi
