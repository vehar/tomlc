#ifndef TOML_PARSER_H_
#define TOML_PARSER_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <string.h>
#include <assert.h>
#include <math.h>
#include <stdarg.h>
#include <string.h>

#include "toml.h"

typedef struct TOMLParser {} *pTOMLParser;

typedef struct TOMLToken {
  int token;
  char *marker;
  char *start;
  char *end;
  int line;
  char *lineStart;
  char *tokenStr;
} TOMLToken;

typedef struct TOMLParserState {
  TOMLTable *rootTable;
  TOMLTable *currentTable;
  int errorCode;
  TOMLError *errorObj;
  TOMLToken *token;
} TOMLParserState;

void * TOMLParserAlloc( void * (*malloc)( size_t ) );
void TOMLParserFree( void *, void (*free)( void * ) );
void TOMLParser( void *, int hTokenId, void *, TOMLParserState * );

int TOMLScan(char *p, int* token, TOMLToken * );

#ifdef __cplusplus
};
#endif

#endif
