package ${packageName}.dagger.component;

import ${packageName}.dagger.module.AppModule;
import ${packageName}.dagger.module.NetModule;
import ${packageName}.viewmodel.${className}ViewModel;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(modules = {AppModule.class, NetModule.class})
public interface NetComponent {
    void inject(${className}ViewModel viewModel);
}
