{-# LANGUAGE OverloadedStrings #-}

-- | Home client-side program.

module Main where

import           View
import           Model

import           Control.Concurrent
import           Control.Monad
import           Prelude hiding (pi)
import           React
import qualified React.Ace as Ace

-- | Grab the container element used for rendering into and start the
-- rendering loop.
main :: IO ()
main =
  do app <- getApp
     ace <- Ace.new app
     void (forkIO (loadingProcess app))
     container <-
       getElementById "react-container"
     react app (render ace) container
