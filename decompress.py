#!/usr/bin/python

import zlib
import sys

#with open(sys.argv[1],'rb') as f:
#    content = f.readlines()
#    
#compressed = ''.join(content)
compressed = open(sys.argv[1], 'rb').read()

decompress = zlib.decompressobj(-zlib.MAX_WBITS)
inflated = decompress.decompress(compressed[14:])
inflated += decompress.flush()

f = open(sys.argv[1]+'.txt', 'wb')
f.write(inflated[:-1])
f.close()

# print (inflated[:-1])