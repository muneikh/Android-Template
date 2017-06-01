package ${packageName}.view;

import android.widget.RelativeLayout;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.viewmodel.${className}ViewModel;

import java.util.Observable;
import java.util.Observer;

import butterknife.BindView;
import butterknife.ButterKnife;
import timber.log.Timber;

public class ${className}Activity extends AppCompatActivity implements Observer {

    private ${className}ViewModel viewModel;

    //    @BindView(R.id.textView)
        TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        RelativeLayout relativeLayout = new RelativeLayout(this);
        textView = new TextView(this);
        relativeLayout.addView(textView);
        setContentView(relativeLayout);

//        setContentView(R.layout.);
//        ButterKnife.bind(this);

        viewModel = new ${className}ViewModel(getApplication());
        setupObserver(viewModel);

        viewModel.executeApi();
    }

    private void setupObserver(Observable observable) {
        observable.addObserver(this);
    }

    @Override
    protected void onDestroy() {
        viewModel.reset();
        super.onDestroy();
    }

    @Override
    public void update(Observable observable, Object data) {
        if (observable instanceof ${className}ViewModel) {
            ${className}ViewModel viewModel = (${className}ViewModel) observable;
            Timber.d("response: %s", viewModel.getRepositoryModel().toJson());
            textView.setText("response : " + viewModel.getRepositoryModel().toJson());
        }
    }
}
