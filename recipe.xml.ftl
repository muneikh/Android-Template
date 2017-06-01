<?xml version="1.0"?>
<recipe>

    <instantiate from="src/app_package/App.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${className}App.java" />

    <instantiate from="src/app_package/dagger/component/NetComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/dagger/component/NetComponent.java" />

    <instantiate from="src/app_package/dagger/module/AppModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/dagger/module/AppModule.java" />

    <instantiate from="src/app_package/dagger/module/NetModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/dagger/module/NetModule.java" />

    <instantiate from="src/app_package/model/RepositoryModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/model/RepositoryModel.java" />

    <instantiate from="src/app_package/service/Api.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/service/GithubApi.java" />

    <instantiate from="src/app_package/view/Activity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/view/${className}Activity.java" />

    <instantiate from="src/app_package/viewmodel/ViewModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/viewmodel/${className}ViewModel.java" />

    <open file="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml"/>
</recipe>
