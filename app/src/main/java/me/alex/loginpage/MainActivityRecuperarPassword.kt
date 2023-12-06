package me.alex.loginpage

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import com.google.android.material.textfield.TextInputEditText
import com.google.firebase.Firebase
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.auth

class MainActivityRecuperarPassword : AppCompatActivity() {
    private lateinit var firebaseAuth: FirebaseAuth

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main_recuperar_password)

        val email: TextInputEditText = findViewById(R.id.emailetc)
        val brecuperar: Button = findViewById(R.id.brecuperar)

        brecuperar.setOnClickListener() {

            sendPasswordReset(email.text.toString())

        }

        firebaseAuth= Firebase.auth

    }
    private fun sendPasswordReset (email: String){
        firebaseAuth.sendPasswordResetEmail(email)
            .addOnCompleteListener() {task ->
                if(task.isSuccessful) {

                    Toast.makeText(baseContext, "Correo de Cambio de Contraseña Enviado!",Toast.LENGTH_SHORT).show()

                }else{
                    Toast.makeText(baseContext,"Error en el proceso",Toast.LENGTH_SHORT).show()



                }
            }
    }


}
