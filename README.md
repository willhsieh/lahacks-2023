# lahacks-2023
LA Hacks 2023

![](demo_1/images/logo.png)

## Inspiration
We are inspired by the stories told by our first-generation immigrant parents. When moving to America it was difficult for them to adapt to their new surroundings. Even now, after living in America for decades, sometimes they still feel as if they aren’t truly at home. Thus we wanted to design an app that allows people from across the world to feel at home, no matter where they are. voyagAR tackles this problem by transforming an unfamiliar landscape into a few points of interest called Viewpoints. voyagAR came from the desire to create a unique, immersive way for people to explore the world around them. Traditional guided tours can be restrictive and costly, while voyagAR offers an assisted, community-driven experience that anyone can contribute to and participate in. 

## What it does
voyagAR uses augmented reality (AR) technology to turn the entire world into a guided tour. When close to a Viewpoint, users will be notified and voyagAR will have a small unintrusive arrow pointing them toward the Viewpoint. If the user chooses to learn more about the area, they can point their phone toward the Viewpoint to receive a guided experience to learn about the significance of the area. Community members can submit Viewpoints and descriptions for approval, helping make the experience truly authentic to the local community.

## How we built it
voyagAR was built using Flutter, Firebase, and ARKit. The app is populated with landmarks and descriptions, such as the John Wooden statue and the Bruin Bear. Our Flutter frontend uses many packages and widgets that enable ARKit and geographic data to be utilized. Different pages are separated into different files, keeping the overall design easy to understand for both developers and users. Our Firebase backend manages all of the location data along with the descriptions for each Viewpoint. Through Geofire, a wrapper library we are able to hash the longitude and latitude coordinates of each Viewpoint to determine the user’s closest proximity Viewpoint. voyagAR was designed to be user-friendly and intuitive, allowing anyone to be a “voyagAR.”

## Challenges we ran into
The biggest challenge we ran into was designing an unobtrusive user experience that balanced voyagAR’s guiding tours while keeping the users grounded in reality. Our goal with voyagAR wasn’t to trap users in the augmented virtual world, but rather supplement the natural world around them. Thus we built a very minimal user interface to not intrude with the physical world.  In our voyage to achieve this perfect experience, we faced many technical challenges as we integrated AR and phone sensors, unlike any other tour app. We were successful in solving these technical challenges by integrating the phone’s GPS and gyroscopic data while pulling nearby landmarks through Firebase to achieve a seamless user experience. 

## Accomplishments that we're proud of
We're proud of creating an app that provides an innovative, community-driven way for people to explore the world around them. We're also proud of the level of precision and accuracy that we were able to achieve with landmarks and descriptions.

## What we learned
Through the development of voyagAR, we learned a lot about the capabilities of AR technology and how it can be best used to create unique experiences. We also gained valuable experience in the importance of user feedback in the app development process, improving our user experience.

## What's next for voyagAR
Moving forward, we plan to continue to expand voyagAR's reach by adding more landmarks and locations to the app. We also plan to incorporate more advanced features, such as multi-landmark virtual guides and AR videos, to make the app even more engaging for users. Ultimately, our goal is to create a truly immersive and customizable guided tour experience that anyone can participate in and contribute to.
