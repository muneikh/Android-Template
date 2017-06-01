package ${packageName};

import android.app.Application;

import ${packageName}.dagger.component.DaggerNetComponent;
import ${packageName}.dagger.component.NetComponent;
import ${packageName}.dagger.module.AppModule;
import ${packageName}.dagger.module.NetModule;

import timber.log.Timber;

public class ${className}App extends Application {

    private NetComponent netComponent;

    @Override
    public void onCreate() {
        super.onCreate();

        netComponent = DaggerNetComponent.builder()
                .appModule(new AppModule(this))
                .netModule(new NetModule("https://api.github.com"))
                .build();

        if (BuildConfig.DEBUG) {
            Timber.plant(new Timber.DebugTree());
        }
    }

    public NetComponent getNetComponent() {
        return netComponent;
    }
}
