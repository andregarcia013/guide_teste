package dev.andre.andregaria_test

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import dev.andre.andregaria_test.ui.theme.Andregaria_testTheme
import io.flutter.embedding.android.FlutterActivity;

class MainActivity : ComponentActivity() {


    private fun openFlutterActivity (route: String) {
        startActivity(
            FlutterActivity
                .withNewEngine()
                .initialRoute(route)
                .build(this)
        )
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            Andregaria_testTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    ) {
                    Box(
                        modifier = Modifier
                            .background(
                                Brush.verticalGradient(
                                    colorStops = arrayOf(
                                        0.0f to MaterialTheme.colorScheme.primary,
                                        1f to MaterialTheme.colorScheme.secondary
                                    )
                                )
                            )
                    ) {
                        Column(
                            modifier = Modifier.fillMaxSize(),
                            verticalArrangement = Arrangement.Center,
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            Button(onClick = {
                               openFlutterActivity("/home");
                            }) {
                                Text(
                                    text = "Variação do Preço",
                                    style = MaterialTheme.typography.bodyLarge
                                )
                            }

                            Button(
                                modifier = Modifier
                                    .padding(18.dp),
                                onClick = {
                                    openFlutterActivity("/chart");
                                }) {
                                Text(
                                    text = "Gráfico de Variação",
                                    style = MaterialTheme.typography.bodyLarge
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}

