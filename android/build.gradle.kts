allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

subprojects {
    buildDir = file("../../build/${project.name}")
    evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(file("../../build"))
}
