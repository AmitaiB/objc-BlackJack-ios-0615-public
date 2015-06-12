{\rtf1\ansi\ansicpg1252\cocoartf949
{\fonttbl}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww9000\viewh8400\viewkind0
}

This isn't actually in Markdown, and I'm not sure that it's technically a readme file, but I needed a place to compose my thoughts, and tie it to the project, and here it is.

The Task: Write a BlackJack game.
The Challenge: Write it well, try to leave it open to expansion without needing a complete rewrite. Also make it easy enough to understand. Clean. Simple.

The Game:
Blackjack aka 21, is a game played with a standard playing deck of 52 cards (no jokers). There are 2+ players, one of whom is The Dealer. The Dealer player follows certain rules, and in return, gets certain advantages. In friendly games, the dealer rotates each hand or so. In casino games, of course, the casino ("the house") is the dealer.
The dealer deals each hand.
Most blackjack has betting, so we must include the possibility to add that functionality. A tally and funds can be tracked in a custom Player class. There will be betting minimums and limits.

Each hand will result in one of the following events for the player:

Lose - the player's bet is taken by the dealer.
Win - the player wins as much as he bet. If you bet $10, you win $10 from the dealer (plus you keep your original bet, of course.)
Blackjack (natural) - the player wins 1.5 times the bet. With a bet of $10, you keep your $10 and win a further $15 from the dealer.
Push - the hand is a draw. The player keeps his bet, neither winning nor losing money.