const express = require('express');
const bodyParser = require('body-parser');
const client = require('prom-client');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());

// Prometheus Metrics
const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics(); // Automatically collect default metrics (e.g., CPU, memory)

app.get('/metrics', async (req, res) => {
    res.set('Content-Type', client.register.contentType);
    res.send(await client.register.metrics());
});

// Health Check with Dependency Simulation
app.get('/health', async (req, res) => {
    // Simulating a database connection health check
    const isDatabaseConnected = true; // Replace with actual DB check logic
    if (!isDatabaseConnected) {
        return res.status(500).send({ status: 'FAIL', dbConnection: false });
    }
    res.status(200).send({ status: 'OK', dbConnection: true });
});

// Root Endpoint
app.get('/', (req, res) => {
    res.send('Welcome to your Node.js app!');
});

// Start the Server
const server = app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});

module.exports = { app, server };
