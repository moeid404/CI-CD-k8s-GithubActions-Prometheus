const request = require('supertest');
const { app, server } = require('./app');

describe('Node.js App Tests', () => {
    afterAll(() => {
        // Close the server after tests
        server.close();
    });

    it('Health check should return status OK', async () => {
        const res = await request(app).get('/health');
        expect(res.statusCode).toBe(200);
        expect(res.body.status).toBe('OK');
        expect(res.body.dbConnection).toBe(true);
    });

    it('Metrics endpoint should return Prometheus metrics', async () => {
        const res = await request(app).get('/metrics');
        expect(res.statusCode).toBe(200);
        expect(res.headers['content-type']).toContain('text/plain');
    });

    it('Root endpoint should return Welcome message', async () => {
        const res = await request(app).get('/');
        expect(res.statusCode).toBe(200);
        expect(res.text).toBe('Welcome to your Node.js app!');
    });
});
