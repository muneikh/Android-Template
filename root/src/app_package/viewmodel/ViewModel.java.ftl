package ${packageName}.viewmodel;

import android.app.Application;

import ${packageName}.${className}App;
import ${packageName}.model.RepositoryModel;
import ${packageName}.service.GithubApi;

import java.util.List;
import java.util.Observable;

import javax.inject.Inject;

import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.schedulers.Schedulers;
import retrofit2.Response;
import retrofit2.Retrofit;
import timber.log.Timber;

public class ${className}ViewModel extends Observable {

    private CompositeDisposable compositeDisposable = new CompositeDisposable();
    private RepositoryModel repositoryModel;

    @Inject
    Retrofit retrofit;

    public ${className}ViewModel(Application application) {
        ((${className}App) application).getNetComponent().inject(this);
        repositoryModel = new RepositoryModel();
    }

    public void executeApi() {
        retrofit.create(GithubApi.class).getRepositoryList("google", 1, 10)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(response -> {
                    processResponse(response);
                }, throwable -> {
                    Timber.e("executeApi: " + throwable.getLocalizedMessage());
                }, () -> {
                    Timber.d("executeApi: operation completed");
                });
    }

    private void processResponse(Response<List<RepositoryModel.Repository>> response) {
        Timber.d("executeApi: " + response.code());
        List<RepositoryModel.Repository> repositories = response.body();
        repositoryModel.getRepositories().addAll(repositories);
        notifyChange();
    }

    public void reset() {
        unSubscribeFromObservable();
        compositeDisposable = null;
    }

    private void notifyChange() {
        setChanged();
        notifyObservers();
    }

    public RepositoryModel getRepositoryModel() {
        return repositoryModel;
    }

    private void unSubscribeFromObservable() {
        if (compositeDisposable != null && !compositeDisposable.isDisposed()) {
            compositeDisposable.dispose();
        }
    }
}
