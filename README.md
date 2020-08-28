# Speech Recognizer Modification

This app demonstrates a particular bug that is new on Agora 3.0 and versions above. It is based off of https://github.com/AgoraIO/Advanced-Audio/tree/b5aebcabb2895558f6f90455f5e14833a67614b6/iOS%26macOS/SpeechRecognizer-iOS

**The bug**: Noise suppression from the chatRoomGaming profile only seems to apply if there is another participant in the agora channel

With this modified sample app, you can:

- Voice chat
- Speech to text
- Toggle a temporary recording of your voice.

## Bug replication Steps
1. First, make sure you have two iPhones. Setup and run this project on both phones.
2. Run 1 (only participant in Agora channel) [Demo](./ExampleRunThroughVideos/OnlyParticipant.MP4)
    1. Join a channel using the English Locale on Device 1.
    2. Tap the "Toggle Recording Button"
    3. Repeat the following 3-4 times:  
           *- Say "Testing, Testing, Testing", then make a loud tapping sound (the sound of your fingers on a wooden or plastic surface)
    4. Tap the "Toggle Recording Button" again.
    5. The iOS Activity Sheet now pops up. Hit "Save Video" to save the video to your iOS camera roll (aka Photo album).
    6. Now go to your iOS Photos, and find the video you just saved. Play the video. You should hear a recording containing the taps.
3. Run 2 (with another participant in the Agora channel) [Demo](./ExampleRunThroughVideos/MultipleParticipant.MP4)
    1. Join a channel using the English Locale on Device 1.
    2. Join the same channel using English Locale on Device 2. Make sure Device 2 is in a separate room from Device 1.
    3. Tap the "Toggle Recording Button" on Device 1.
    3. Repeat the following 3-4 times:  
           *- Say "Testing, Testing, Testing", then make a loud tapping sound (the sound of your fingers on a wooden or plastic surface)
    4. Tap the "Toggle Recording Button" on Device 1 again.
    5. The iOS Activity Sheet now pops up. Hit "Save Video" to save the video to your iOS camera roll (aka Photo album).
    6. Now go to your iOS Photos, and find the video you just saved. Play the video. You should hear a recording that largely filters out the taps.


## Prerequisites
- Xcode 12.0+
- Physical iOS device (iPhone or iPad)
- iOS simulator is NOT supported

## Quick Start

This section shows you how to prepare, build, and run the sample application.

### Obtain an App Id

To build and run the sample application, get an App Id:

1. Create a developer account at [agora.io](https://dashboard.agora.io/signin/). Once you finish the signup process, you will be redirected to the Dashboard.
2. Navigate in the Dashboard tree on the left to **Projects** > **Project List**.
3. Save the **App Id** from the Dashboard for later use.
4. Generate a temp **Access Token** (valid for 24 hours) from dashboard page with given channel name, save for later use.

5. Open `SpeechRecognizer-iOS.xcodeproj` and edit the `AppID.swift` file. Update `<#Your App Id#>` with your App Id, and assign the token variable with the temp Access Token generated from dashboard.

    ``` Swift
    let AppID: String = <#Your App Id#>
    // assign Token to nil if you have not enabled app certificate
    let Token: String? = <#Temp Token#>
    ```

### Integrate the Agora Audio SDK

1. Download the [Agora Voice SDK](https://www.agora.io/en/download/). Unzip the downloaded SDK package and copy the following files from the SDK `libs` folder into `iOS&macOS/libs/iOS` folder.

    - `AograRtcKit.framework`
  
2. Connect your iPhone or iPad device and run the project. Ensure a valid provisioning profile is applied or your project will not run.

## How to Use

1. Choose the language to recognize.
2. Enter a channel name in the TextFiled, and join.
3. The app begins routes the audio data received from remote user to the Speech framework, and displays the recognized text from Speech framework in the text view.
4. Press Leave channel to stop speech recognition and leave the channel.

- Important: Only the first remote user in channel will be performed speech recognition.

## Developer Environment Requirements

* Xcode 10.0 +
* Real devices (iPhone or iPad)
* iOS simulator is NOT supported

## Contact Us

- For potential issues, take a look at our [FAQ](https://docs.agora.io/en/faq) first
- Dive into [Agora SDK Samples](https://github.com/AgoraIO) to see more tutorials
- Take a look at [Agora Use Case](https://github.com/AgoraIO-usecase) for more complicated real use case
- Repositories managed by developer communities can be found at [Agora Community](https://github.com/AgoraIO-Community)
- You can find full API documentation at [Document Center](https://docs.agora.io/en/)
- If you encounter problems during integration, you can ask question in [Stack Overflow](https://stackoverflow.com/questions/tagged/agora.io)
- You can file bugs about this sample at [issue](https://github.com/AgoraIO/Advanced-Audio/issues)

## License

The MIT License (MIT).
