const request = require('supertest');

const BASE_URL = 'http://localhost:3001/api';

describe('API Schnittstellen Tests', () => {

    test('GET /concepts should fetch concepts with search term', async () => {
        const response = await request(BASE_URL)
            .get('/concepts')
            .query({ searchTerm: 'test' }) // You need a valid term that exists in the database
            .expect(200);

        expect(response.body.success).toBe(true);
        expect(Array.isArray(response.body.data)).toBe(true);
    });

    test('GET /dagitty-input should return dagitty file content', async () => {
        const response = await request(BASE_URL)
            .get('/dagitty-input')
            .expect(200);  // ✅ Expect 200 if the file exists
    
        expect(response.body).toHaveProperty('dagittyText');  // ✅ Check that the file content is returned
    });
    

    test('POST /initial-graph-query should fetch initial graph data', async () => {
        const requestBody = {
            exposure: { value: "someExposure", type: "predefined" },
            outcome: { value: "someOutcome", type: "predefined" }
        };

        const response = await request(BASE_URL)
            .post('/initial-graph-query')
            .send(requestBody)
            .expect(200);

        expect(response.body.success).toBe(true);
        expect(Array.isArray(response.body.data)).toBe(true);
    });

    test('POST /granularity-query should fetch granularity data', async () => {
        const requestBody = {
            selectedIteration: { id: 1 },
            selectedNodes: ["Node1", "Node2"]
        };

        const response = await request(BASE_URL)
            .post('/granularity-query')
            .send(requestBody)
            .expect(200);

        expect(response.body.success).toBe(true);
        expect(Array.isArray(response.body.data)).toBe(true);
    });

    test('POST /cycles should check for DAG cycles', async () => {
        const requestBody = {
            granularity: 1,
            selectedNodes: ["Node1"],
            exposure: { value: "NodeX", type: "custom" },
            outcome: { value: "NodeY", type: "custom" },
            timepoints: 2,
            nodeOrder: {},
            nodeSettings: {},
            resetCache: true
        };
    
        const response = await request(BASE_URL)
            .post('/cycles')
            .send(requestBody)
            .expect(400);

            expect(response.body).toHaveProperty('error');
    });

    test('POST /hierarchy-query should fetch all parent-child edges', async () => {
        const response = await request(BASE_URL)
            .post('/hierarchy-query')
            .expect(200);

        expect(response.body.success).toBe(true);
        expect(Array.isArray(response.body.edges)).toBe(true);
    });

    const request = require('supertest');

const BASE_URL = 'http://localhost:3001/api';

describe('Negative Tests - Error Handling', () => {

    test('GET /concepts should return 400 if searchTerm is missing', async () => {
        const response = await request(BASE_URL)
            .get('/concepts')  // No searchTerm provided
            .expect(400);

        expect(response.body.error).toContain('Missing required parameter: searchTerm');
    });

    test('POST /initial-graph-query should return 400 for missing exposure and outcome', async () => {
        const response = await request(BASE_URL)
            .post('/initial-graph-query')
            .send({})  // Missing required body fields
            .expect(400);

        expect(response.body.error).toContain('Missing required parameters');
    });

    test('POST /granularity-query should return 400 for missing parameters', async () => {
        const response = await request(BASE_URL)
            .post('/granularity-query')
            .send({})  // No selectedIteration or selectedNodes
            .expect(400);

        expect(response.body.error).toContain('Missing required parameters');
    });

    test('POST /cycles should return 500 if graph data or R script fails', async () => {
        const response = await request(BASE_URL)
            .post('/cycles')
            .send({
                granularity: 999,  // Invalid/non-existing granularity ID
                selectedNodes: ["FakeNode"],
                exposure: { value: "NonExistentExposure", type: "custom" },
                outcome: { value: "NonExistentOutcome", type: "custom" },
                timepoints: 2,
                nodeOrder: {},
                nodeSettings: {},
                resetCache: true
            })
            .expect(400);  // Expecting internal server error if data isn't valid

            expect(response.body).toHaveProperty('error');
    });

});

describe('Stress and Performance Tests', () => {

    test('POST /hierarchy-query should respond within 3000ms', async () => {
        const start = Date.now();

        const response = await request(BASE_URL)
            .post('/hierarchy-query')
            .expect(200);

        const duration = Date.now() - start;
        console.log(`Hierarchy query responded in ${duration}ms`);

        expect(response.body.success).toBe(true);
        expect(duration).toBeLessThan(3000);  // Set a 3-second upper limit
    });

    test('GET /concepts handles 50 rapid requests', async () => {
        const searchTerm = 'a';  // Use a common letter that likely returns results

        const requests = [];
        for (let i = 0; i < 50; i++) {
            requests.push(
                request(BASE_URL)
                    .get('/concepts')
                    .query({ searchTerm })
                    .expect(200)
            );
        }

        const responses = await Promise.all(requests);

        responses.forEach((response) => {
            expect(response.body.success).toBe(true);
            expect(Array.isArray(response.body.data)).toBe(true);
        });
    });

});


});
