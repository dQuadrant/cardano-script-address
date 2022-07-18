{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE NoImplicitPrelude  #-}
{-# LANGUAGE TemplateHaskell    #-}
{-# OPTIONS_GHC -fno-ignore-interface-pragmas #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE NumericUnderscores#-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
module Plutus.Contracts.V1.Simple
where

import Plutus.V1.Ledger.Api
import qualified PlutusTx

{-# INLINABLE mkWrappedScript #-}
mkWrappedScript :: BuiltinData -> BuiltinData -> BuiltinData -> ()
mkWrappedScript  d r c = ()

simpleScriptValidator :: Validator
simpleScriptValidator = mkValidatorScript
            $$(PlutusTx.compile [|| mkWrappedScript ||])

simpleScript :: Script
simpleScript =  unValidatorScript  (simpleScriptValidator)