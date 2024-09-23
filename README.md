# Neovim Config

## Introduction

Neovim is a forked version of Vim that has developed along side it with the goal of further customization options and better plugin support and development.

## Goal

I try to keep things simple and well-organized. I don't want to bloat my nvim with plugins I don't need. Although, I might not be able to completely stop myself there -- specially with cosmetic plugins...

This nvim setup is my attempt to switch away from VSCode. I was a loyal VSCode user for years, but I found that I just don't use VSCode how it is meant to be used, and I was actually trying to make VSCode act like Vim. So why not switch to the real deal?

## Scheme

I use a structured plugin setup that is centered around [lazy.nvim](https://github.com/folke/lazy.nvim).

I keep general configuration (including lazy.nvim initialization) in `./lua/config`, and I keep individual plugin configuration in `./lua/plugins`.

## Installation

This is a Neovim config like any other, so all you need to do is:

1. Make a backup of your current nvim config (optional but recommended): `mv ~/.config/nvim ~/.config/nvim.bkp`
2. Clone this repo into the config folder: `git clone <this repo ssh> ~/.config/nvim`

## SCF

This will run just fine on SCF LC, but you need a few things:

1. The correct Neovim binary on your PATH. This is easily done by using Hopper and moving an Nvim binary into a folder on your PATH (like ~/bin).
2. All plugins installed properly. Lazy.nvim needs an internet connection to install plugins, so you can install all your plugins on the OCF with Lazy, then Hopper over the necessary files. This can be laborious, so I have made a set of scripts that make this easier for you at [nvim_transfer](https://rzlc.llnl.gov/gitlab/aeag/users/sazima1/neovim/neovim-transfer).
