//+------------------------------------------------------------------+
//|                                          KhaiNuiDaimondPhase.mq4 |
//|                              Copyright 2024, The Market Survivor |
//|                       https://www.facebook.com/TheMarketSurvivor |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, The Market Survivor"
#property link      "https://www.facebook.com/TheMarketSurvivor"
#property version   "1.00"
#property strict

string EA_NAME = "KhaiNuiDaimondPhase";
string Owner = "The Market Survivor";
string OwnerLink = "https://www.facebook.com/TheMarketSurvivor";

string eaInfo = EA_NAME + "\n" + Owner + "\n" + OwnerLink;

enum trend  // enumeration of trend in tf Day
  {
   BUY,
   SELL,
   NOTHING
  };

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   Comment(""); // Clear previous comments
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   Comment(""); // Clear the comment when the EA is removed
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
// Define the daily time frame
   int tfDay = PERIOD_D1;

// Get yesterday's close price
   double yesterdayClose = iClose(NULL, tfDay, 1);

// Get the previous day's EMA 50
   double ema50tfDay = iMA(NULL, tfDay, 50, 0, MODE_EMA, PRICE_CLOSE, 1);

// Get the previous day's EMA 200
   double ema200tfDay = iMA(NULL, tfDay, 200, 0, MODE_EMA, PRICE_CLOSE, 1);

   Comment(
      "\n" +
      "--------------------" +
      "\n" +
      eaInfo +
      "\n" +
      "--------------------" +
      "\n" +
      "close: " + DoubleToString(yesterdayClose, 5) +
      "\n" +
      "ema50: " + DoubleToString(ema50tfDay, 5) +
      "\n" +
      "ema200: " + DoubleToString(ema200tfDay, 5) +
      "\n" +
      "--------------------"
   );
  }
//+------------------------------------------------------------------+
