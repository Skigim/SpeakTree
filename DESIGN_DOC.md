Project Design Document: FreeSpeech AAC (Mobile)1. Executive SummaryA customizable, mobile-first Augmentative and Alternative Communication (AAC) application. The app utilizes a "Linked Folder" navigation pattern where buttons can serve dual purposes: speaking a word and navigating to a deeper category. It prioritizes low-latency interaction for immediate communication while offering high-fidelity Text-to-Speech (TTS) capabilities via cloud integrations.2. Technical Stack (Flutter)Framework: Flutter (Dart) - Selected for cross-platform performance and consistent touch latency.State Management: Riverpod - Robust handling of the vocabulary graph, audio state, and edit modes.Local Persistence: Hive or Isar - NoSQL, fast key-value storage for the JSON-like vocabulary tree.Audio Engine: * flutter_tts (Local device voice for immediate feedback).audioplayers (Cloud WAV/MP3 playback for full sentences).3. Data ArchitectureThe data model uses a unified "Card" entity rather than separate types for Words and Folders. This allows for "Hybrid" cards (e.g., a card that speaks "I" and immediately opens the "Actions" folder).3.1. Schema (Dart Implementation)class CardModel {
  String id;
  String label;
  String emoji;
  
  // Visuals
  String colorId; // Maps to Fitzgerald Key (e.g., 'yellow', 'green')
  
  // Behaviors (Nullable to indicate disabled state)
  String? speechText;      // If present, app speaks this text on tap
  String? linkedFolderId;  // If present, app navigates to this folder ID on tap
  
  // Metadata
  int sortOrder;
}

class FolderModel {
  String id;
  String title;
  String? parentId; // For "Back" navigation logic
  List<CardModel> cards;
}

class AppSettings {
  bool isEditMode;
  bool useBrowserVoice; // Toggle for immediate feedback
  String? cloudApiKey;  // Gemini or ElevenLabs
  String? cloudVoiceId;
}
4. Feature Specifications4.1. Navigation & InteractionTap Logic:Speak: If speechText exists, trigger Local TTS immediately.Navigate: If linkedFolderId exists, wait ~150ms (for visual feedback) then slide to the new folder.Empty State: If a folder has 0 cards:User Mode: Display "Empty Folder" placeholder to prevent getting stuck.Edit Mode: Display large "Add Card" button.Back Navigation: Standard top-left "Back" button and "Home" button to reset to root.4.2. Sentence StripInput: Tapping any card with speechText appends it to the strip.Playback: Tapping the strip or "Play" button triggers the High-Quality Cloud TTS.Visuals: Horizontal scrollable list of cards at the top of the screen.4.3. Edit Mode (CRUD)Toggleable via Settings.Visual Indicators: * Pencil Icon: Appears on the top-left of every card.Add Button: A dashed "Plus" card appears at the end of the grid.Delete Icon: Trash can icon appears on top-right of cards.Functionality: * Clicking the Pencil opens the Creator Modal pre-filled with that card's data.Deleting a card unlinks the folder but does not necessarily delete the folder data (to prevent accidental data loss), leaving it orphaned but recoverable if re-linked.4.4. The Creator ModalA unified form for creating/editing cards.Inputs: Label, Emoji (with picker), Text-to-Speech string.Behavior Toggles:[x] Speak Label[x] Link to Folder (New or Existing)Color Picker: Vertical Snap Carousel (Slot machine style).Displays Color + Meaning (e.g., "Green - Actions", "Yellow - People") to enforce Fitzgerald Key standards.Auto-centers selection.5. UI/UX GuidelinesFitzgerald Key Colors:Yellow: People / PronounsGreen: Verbs / ActionsBlue: AdjectivesOrange: NounsPurple: Places / Games / CustomWhite/Grey: Misc / Function wordsCard Visuals:Chevron (^): Located at Top-Center. Indicates the card leads to another folder.Text: Bottom-Center, bold, high legibility.Emoji: Center, large scale.6. Cloud Audio Integration6.1. StrategyImmediate Feedback: Use Local Device TTS (zero latency) for button taps.Sentence Playback: Use Cloud API for the "Play" button on the sentence strip for natural prosody.6.2. ProvidersElevenLabs:Model: eleven_turbo_v2_5 (Low latency).API: Streaming endpoint.Gemini:Model: gemini-2.5-flash-preview-tts.Format: PCM/WAV (requires header injection in client).7. Migration Roadmap (Flutter)Project Init: flutter create aac_app.Dependencies: Add flutter_riverpod, hive, flutter_tts, audioplayers, http.Data Layer: create Folder and Card Hive adapters. Implement seed data injection on first run.UI Implementation:Build CardWidget with the Chevron/Pencil conditional rendering.Build GridPage with SliverGrid.Implement CreatorModal with ListWheelScrollView for the color picker.Logic: Connect navigation state and Sentence Strip provider.
