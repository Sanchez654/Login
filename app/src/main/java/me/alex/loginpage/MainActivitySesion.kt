package me.alex.loginpage

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.google.firebase.auth.FirebaseAuth
import me.alex.loginpage.databinding.ActivityMainSesionBinding

class MainActivitySesion : AppCompatActivity() {


    private lateinit var binding: ActivityMainSesionBinding
    private lateinit var firebaseAuth: FirebaseAuth

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainSesionBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //Linea agregada para el forgotpass

        binding.fpass.setOnClickListener{
            val recuperar = Intent(this,MainActivityRecuperarPassword::class.java)
            startActivity(recuperar)
        }

        firebaseAuth = FirebaseAuth.getInstance()

        binding.bregistrarse.setOnClickListener {
            val intent = Intent(this, MainActivityRegistro::class.java)
            startActivity(intent)
        }

        binding.bsesion.setOnClickListener {

            val email = binding.emailedit.text.toString()
            val pass = binding.passwordedit.text.toString()

            if (email.isNotEmpty() && pass.isNotEmpty()) {

                firebaseAuth.signInWithEmailAndPassword(email, pass).addOnCompleteListener {
                    if (it.isSuccessful) {
                        val intent = Intent(this, MainActivityInicio::class.java)
                        startActivity(intent)

                    } else {
                        // Agregada
                        Toast.makeText(baseContext,"Contraseña o Usuario Incorrectos",Toast.LENGTH_SHORT).show()

                    }

                }

            } else {
                Toast.makeText(this, "Los campos están vacios", Toast.LENGTH_SHORT).show()


            }

        }


    }
}