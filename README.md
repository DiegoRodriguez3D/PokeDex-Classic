# 📚 PokeDex Classic

## Description

**PokeDex Classic** is a SwiftUI application that displays information about the first 151 Pokémon from the Pokédex. This app allows users to search for Pokémon by name and view details such as basic stats and information.

Data is fetched directly from [PokeAPI](https://pokeapi.co/), a public API that provides extensive information about Pokémon.

## 🛠️ Technologies Used

- **SwiftUI**
- **MVVM**
- **PokeAPI**

## 🚀 Features

- **Pokémon List**: Navigate through a list displaying the first 151 Pokémon.
- **Pokémon Detail**: Shows detailed information about the selected Pokémon, including statistics, basic information and types.
- **Pokémon Search**: Allows filtering Pokémon by name using a search bar.
- **Adaptive UI**: Supports light and dark themes, adapting to the user's system preferences.

## 📂 Project Structure
- **App**
  - `PokeDex_ClassicApp.swift`: Application entry point.
- **Onboarding**
  - `OnboardingView.swift`: Initial view for new users.
  - `OnboardingViewDetails.swift`: Specific details of the onboarding view.
- **ListView**
  - `ListView.swift`: View that lists all Pokémon.
- **DetailView**
  - `DetailView.swift`: View that shows the details of a specific Pokémon.
- **ViewModel**
  - `PokemonViewModel.swift`: Central business logic to manage Pokémon data.
- **DataService**
  - `DataService.swift`: Service to handle data retrieval from PokeAPI.
- **Components**
  - `AboutTextView.swift`: Component that displays the 'About' section of a Pokémon.
  - `StatsView.swift`: Component that displays a Pokémon's statistics.
  - `PokemonCard.swift`: Representational card of a Pokémon in the list.
- **Model**
  - `Pokemon.swift`: Model representing a Pokémon.
- **Helper**
  - `PokemonTypeColorHelper.swift`: Helper to manage colors according to Pokémon type.

## 📸 Screenshots
![onboarding1](https://github.com/user-attachments/assets/7215b17b-1cc6-4f4e-b9a4-a24b7220f027)
![onboarding2](https://github.com/user-attachments/assets/c464e6db-347f-4601-bf33-bbb6fd4d50ff)
![main](https://github.com/user-attachments/assets/19c33cf0-eddb-4710-b25f-0931875887cf)
![search](https://github.com/user-attachments/assets/12e71b5f-1318-422d-977e-2578cf934009)
![about](https://github.com/user-attachments/assets/49e099f2-4fe9-4f33-a1ca-d1da4b6fb002)
![stats](https://github.com/user-attachments/assets/deb6ff42-b5c3-4f38-b1e4-4092ae7d4ac0)
