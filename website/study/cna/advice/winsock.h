/*
 * Fake winsock.h that ought to help students compile their C/C++ programs using
 * winsock on Linux.
 *
 * Written by Marius Gedminas in about 5 minutes, so it might not be complete.
 */

#ifndef _WINSOCK_H
#define _WINSOCK_H

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/ip.h>
#include <netdb.h>

typedef int SOCKET;
const int SOCKET_ERROR = -1;
const int INVALID_SOCKET = -1;
#define closesocket close

typedef int WSADATA;
#define MAKEWORD(x,y) 0
#define WSAStartup(x,y) 0
#define WSACleanup() 0

typedef unsigned int WORD; /* XXX should it be unsigned? */

#endif