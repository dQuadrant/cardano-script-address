{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE NumericUnderscores #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleContexts #-}

module Main
where

import Cardano.Api.Shelley 
import Cardano.Api
import Codec.Serialise (serialise)
import Plutus.Contracts.V1.Simple
import qualified Data.ByteString.Short as SBS
import qualified Data.ByteString.Lazy as LBS
import Data.Text.Conversions
import qualified Data.Aeson as A
import qualified Data.Text as T

toHexString :: (FromText a1, ToText (Base16 a2)) => a2 -> a1
toHexString bs = fromText $  toText (Base16 bs)

main :: IO ()
main = do       
  let networkId = Testnet $ NetworkMagic 1097911063
      scriptSBS = SBS.toShort . LBS.toStrict $ serialise simpleScript
      simpleScriptPlutus = PlutusScript PlutusScriptV1 $ PlutusScriptSerialised scriptSBS
      scriptHash = hashScript simpleScriptPlutus
      addr = makeShelleyAddress networkId (PaymentCredentialByScript scriptHash) NoStakeAddress
  putStrLn $ "Script Address : " ++ T.unpack (serialiseAddress addr)
  print $ A.encode $ serialiseToTextEnvelope Nothing simpleScriptPlutus
