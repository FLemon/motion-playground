class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Fabric.with([Crashlytics.sharedInstance])
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    storyboard = UIStoryboard.storyboardWithName "main", bundle: nil
    storyboard.instantiateInitialViewController
    @window.rootViewController = storyboard.instantiateInitialViewController

    @window.makeKeyAndVisible
    true
  end
end
