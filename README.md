# 🌊 Easy Eel

Dive into a minimalistic command line experience with Easy Eel for the Fish shell. With comprehensive customization features, you can tailor the theme to your liking. And to brighten your sessions, expect unique, ocean-themed greetings each time!

<img src="https://github.com/pgolebiowski/theme-easy-eel/assets/7394091/ff5920f6-721a-4d49-823c-b2dfbda530a4" alt="Demonstration of the Easy Eel theme in action: showcasing user, host, directory, Git branch, and repository states. Also illustrates the outcome-based color change of the prompt indicator." width="75%">

## 🎣 Getting started

With [Fish Shell](https://fishshell.com) and [Fisher](https://github.com/jorgebucaran/fisher) installed, simply run:

```sh
fisher install pgolebiowski/theme-easy-eel
```

## 🌟 Features

- 🐠 **Clean Interface.** A straightforward and uncluttered prompt.
- 🌅 **Oceanic Greetings.** Get inspired with sea-themed messages every time you open a new terminal session.
- 🛠️ **Granular Customization.** Tailor the theme to your needs, from aesthetics to behavior.

## 🦑 Customization

Easy Eel provides two distinct avenues for personalization:

1. **Environment Variables.** For refining the theme's appearance, make use of specific variables. Adjust elements like colors, symbols, or even toggle on/off certain prompt parts.
   
<img src="https://github.com/pgolebiowski/theme-easy-eel/assets/7394091/633f9200-6398-4f5a-9a1c-12723a2ea602" alt="Demonstrating the use of environment variables to modify the prompt appearance. In this example, the prompt indicator has been changed to '🌊 ', the user color is set to blue, and the host display has been hidden." width="75%">

2. **Override Functions.** When you wish to modify the theme's behavior or replace entire prompt sections, these functions come into play. When defined, they will override Easy Eel's defaults for the associated prompt segment.

<img src="https://github.com/pgolebiowski/theme-easy-eel/assets/7394091/e19ef564-62fa-4f85-88b6-32a9ed306c68" alt="Showcasing the use of an override function to replace the default user name. Here, the `easy_eel_override_user` function is defined to change the user name to 'Dockside Dave' in the prompt." width="75%">

## 📚 Documentation

### Greeting 

- **Purpose:** Welcome users with random ocean-themed inspirations.
- **Default:** A collection of light-hearted and encouraging ocean-themed greetings to kickstart your terminal session.
- **Override:** `easy_eel_override_greeting`

### Title

- **Purpose:** Terminal title. Shows the directory by default.
- **Override:** `easy_eel_override_title`

### Prompt Sections

#### User

- **Purpose**: Display the current user.
- **Color**: `EASY_EEL_COLOR_USER` (default: `brred`)
- **Override**: `easy_eel_override_user`
- **Toggle**: `EASY_EEL_HIDE_USER`

#### Host

- **Purpose**: Show hostname. Different style for SSH sessions.
- **Default Color**: `EASY_EEL_COLOR_HOST_DEFAULT` (default: `yellow`)
- **SSH Color**: `EASY_EEL_COLOR_HOST_SSH` (default: `--bold red`)
- **Override**: `easy_eel_override_host`
- **Toggle**: `EASY_EEL_HIDE_HOST`

#### Current Directory

- **Purpose**: Reveal current directory.
- **Color**: `EASY_EEL_COLOR_CURRENT_DIRECTORY` (default: `green`)
- **Override**: `easy_eel_override_current_directory`
- **Toggle**: `EASY_EEL_HIDE_CURRENT_DIRECTORY`

#### Git

- **Purpose**: Displays the Git branch name and repository state.
- **Variables:**
  - `EASY_EEL_COLOR_GIT_BRANCH` (default: `purple`)
  - `EASY_EEL_COLOR_GIT_STATE` (default: `blue`)
  - `EASY_EEL_SYMBOL_GIT_DIRTY` (default: `!`)
  - `EASY_EEL_SYMBOL_GIT_UNTRACKED` (default: `☡`)
  - `EASY_EEL_SYMBOL_GIT_STASH` (default: `↩`)
  - `EASY_EEL_SYMBOL_GIT_CLEAN` (default: `✓`)
- **Toggle**: `EASY_EEL_HIDE_GIT_STATE`

#### Prompt Indicator

- **Purpose**: Indicates where the user can start typing commands. Color changes based on the outcome of the previous command.
- **Variables:**
  - `EASY_EEL_SYMBOL_PROMPT_INDICATOR` (default: `↪ `)
  - `EASY_EEL_COLOR_PROMPT_NORMAL` (default: `normal`)
  - `EASY_EEL_COLOR_ERROR` (default: `red`)

## 🐳 Support

Having trouble with Easy Eel or have a feature suggestion? Simply head to the [**Issues** tab](https://github.com/pgolebiowski/theme-easy-eel/issues) to share your feedback. Every comment helps make the theme better!

## 🤝 Contributions

You're welcome to contribute! Fork the repository, implement and test your changes, and submit a pull request detailing your updates.

## 💡 Inspiration

- https://github.com/mathiasbynens/dotfiles
- https://github.com/necolas/dotfiles
- https://github.com/lfiolhais/theme-simple-ass-prompt

## ⚖️ License

The theme code is yours to customize, utilize, and spread ([the MIT License](/LICENSE)). Kindly consider a mention or link back to this project whenever you share it. Enjoy!
