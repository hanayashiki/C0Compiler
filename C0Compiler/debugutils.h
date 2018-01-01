#pragma once

#define verbose true

#define printfd(fmt, ...) if (verbose) do { printf(fmt, __VA_ARGS__);printf(" [line %d, %s]\n", __LINE__, __FUNCTION__); } while(0)

#define coutd cout##<<##"[line "##<<##__LINE__##<<##", "##<<##__FUNCTION__##<<##"] "

