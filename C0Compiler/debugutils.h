#pragma once

#define verbose true

#define printfd(fmt, arg, ...) if (verbose) do { printf(fmt, ##arg);printf(" [line %d, %s]\n", __LINE__, __FUNCTION__); } while(0)