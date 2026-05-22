import express from 'express'

const app = express()
const PORT = process.env.PORT || 3000

// Middleware to parse incoming JSON request bodies
app.use(express.json())

// Health check endpoint - used by Docker and monitoring tools to verify app is running
app.get('/health', (req, res) => {
    res.json({ status: 'healthy', timestamp: new Date().toISOString() })
})

app.get('/', (req, res) => {
    res.json({ message: 'DevSecOps Pipeline Demo' })
})

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`)
})