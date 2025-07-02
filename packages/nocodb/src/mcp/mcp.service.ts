// Only changes shown; rest of your file is untouched except these edits
// For brevity, only showing a few. You need to apply this pattern to **all** tool registrations in the file.

server.registerTool(
  'getBaseInfo',
  {
    description: 'Fetch information about current base',
    annotations: {
      title: 'Get Base Info',
      readOnlyHint: true,
      idempotentHint: true,
    },
  },
  async () => { ... }
);

server.registerTool(
  'getTablesList',
  {
    description: 'List tables accessible by user',
    annotations: {
      title: 'List Tables',
      readOnlyHint: true,
      idempotentHint: true,
    },
  },
  async () => { ... }
);

// Repeat for ALL others: getTableSchema, queryRecords, getRecord, countRecords, readAttachment, aggregate_single, createRecords, updateRecords, deleteRecords

// Example for queryRecords:
server.registerTool(
  'queryRecords',
  {
    description: 'Query Records from a Table',
    inputSchema: {
      tableId: z.string().describe('Table ID'),
      pageSize: z.number().optional().describe('Number of records to fetch (default: 50)'),
      page: z.number().optional().describe('Page number for pagination (default: 1)'),
      where: z.string().optional().describe(whereDescription),
      sort: z.array(
        z.object({
          field: z.string().describe('Field Name'),
          description: z.enum(['asc', 'desc']).describe('Sort Direction'),
        }),
      ),
      fields: z.array(z.string()).optional().describe('Fields to fetch'),
    },
    annotations: {
      title: 'Query Records',
      readOnlyHint: true,
    },
  },
  async ({ tableId, pageSize = 50, page = 1, where, sort, fields }) => { ... }
);

// Apply this to all remaining usages
