### Steps to Run the App

1. Make sure the Swift Packages for `Networking`, `Lottie`, and `SDWebImageSwiftUI` are resolved and compiled.
2. The app defaults to loading the "All Recipes" endpoint with the correctly formatted JSON.
   * To test Malformed JSON handling, change the `recipesEndpoint` var in `ContentViewModel` to a value of `.malformedJSON`
   * To test handling of an empty Recipes response, change the `recipesEndpoint` var in `ContentViewModel` to `emptyResponse`
3. Then just hit "Run" button in Xcode with your preferred simulator selected.

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

I tried to focus on cleanly decoding the JSON responses, making the `Recipe` model conform to the `Codable` protocol, and having the URL strings in the JSON objects encode correctly to optional `URL` vars in the model. I also added a `Previewable` protocol to the `Recipe` model to quickly and easily pass test data to the SwiftUI previews.

I used the `Networking` library, that I've worked with in the past, to quickly set up a Networking service. When doing the Networking call to return recipes, I added a little extra code in to make the three main data scenarios—loading recipes, handling malformed JSON, and getting an empty recipes response—easily testable, and viewable when running the app locally. I also conformed to Apple's async/await architecture, and made sure any Networking errors were passed up to the View Model for handling.

I also wanted to set up my main view model, `ContentViewModel` as an `@EnvironmentObject` as it became clear very early on that more than one subview would rely on it's `@Published` vars for displaying the data correctly.

The main Networking file, `NetworkingService`, is also set up with a generic handler for JSON data. There's only a single model in this project, but other `Codable` models could be added to the future and use the same `handleResponse` function from the `NetworkingService` to return the correct object type.

Also, even though this is a realtively simple application, I organized my code as I would have for a larger app, with many more models, view models, networking calls and views.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

I believe I spent about 4 hours on this project. About 2 hours working on the Model, Networking and ViewModel setup. And then about an hour each for the SwiftUI views and the unit tests.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

I went back and forth on where to trigger the networking call to load recipes. An early version of this code had the data being loaded when `ContentViewModel` was initialized, but that felt messy to me. I opted instead to have the initial data loading be handled from a `task` function within the main SwiftUI view.

### Weakest Part of the Project: What do you think is the weakest part of your project?

The UI could have used a little more flair. In the past I've always collaborated with UX and Design teams to implement UI elements within an iOS app. I felt it was better to focus on architecture rather than UI elements in this case.

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?

Yes. I chose the `Networking` package for it's ease of use in getting an external network request set up quickly. I threw in the `Lottie` library for a little UI flair in having a loading animation (unfortunately, the recipes endpoint returns the JSON very quickly and the animation is barely seen! But, this can be tested by simulating a slow network connection for the simulator), and I used `SDWebImageSwiftUI` for image caching. That library has been a go-to for web image caching in many of the projects I've worked on.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

I couldn't make up my mind on whether to have a pull-to-refresh interaction for reloading the app data, or to have a nav bar button instead. In the end I left both in.
