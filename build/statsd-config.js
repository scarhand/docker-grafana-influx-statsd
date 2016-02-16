{
    port: 8125,
    mgmt_port: 8126,
    percentThreshold: [ 50, 75, 90, 95, 98, 99, 99.9, 99.99, 99.999],
    influxdb: {
        version: 0.9,
        host: 'localhost', // InfluxDB host. (default 127.0.0.1)
        port: 8086, // InfluxDB port. (default 8086)
        database: 'data',  // InfluxDB database instance. (required)
        flush: {
            enable: true // Enable regular flush strategy. (default true)
        },
        proxy: {
            enable: false, // Enable the proxy strategy. (default false)
            suffix: 'raw', // Metric name suffix. (default 'raw')
            flushInterval: 1000 // Flush interval for the internal buffer.
                // (default 1000)
        }
    },
    backends: ['statsd-influxdb-backend']
}