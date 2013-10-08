{-# LANGUAGE ForeignFunctionInterface #-}
#include <bindings.dsl.h>
#include <cpptypes.hpp>
module OpenCVRaw.CppTypes where
#strict_import

{- Provides wrappers for core c++ types that Haskell doesn't have access to 
 - but opencv requires. -}
import OpenCVRaw.Types
import Foreign.C
import Foreign.C.Types
import Foreign.Ptr

#ccall std_create_vector_int , Ptr CInt -> CSize -> IO (Ptr <vector_int>)

#ccall std_create_string , Ptr CChar -> CSize -> IO (Ptr <String>)

toStdString :: String -> IO (Ptr C'String)
toStdString s = do
  (cs,l) <- newCStringLen s
  c'std_create_string cs (fromIntegral l)