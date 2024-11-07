{
  globalWithDiagnosticsHttpServer(listenAddress): {
    diagnosticsHttpServer: {
      httpServers: [{
        listenAddresses: [listenAddress],
        authenticationPolicy: { allow: {} },
      }],
      enablePrometheus: true,
      enablePprof: true,
      enableActiveSpans: true,
    },
  },

  blobstore: {
    contentAddressableStorage: {
      grpc: {
        address: 'localhost:6666',
      },
    },
    actionCache: {
      completenessChecking: {
        backend: {
          grpc: {
            address: 'localhost:6666',
          },
        },
        maximumTotalTreeSizeBytes: 1024 * 1024 * 1024,
      },
    },
  },
  browserUrl: 'http://localhost:7984',
  maximumMessageSizeBytes: 1024 * 1024 * 1024,
}
