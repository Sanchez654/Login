package me.alex.loginpage

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.google.firebase.auth.FirebaseAuth
import me.alex.loginpage.databinding.ActivityMainRegistroBinding
import me.alex.loginpage.databinding.ActivityRegistroprofesBinding


class ActivityRegistroProfes : AppCompatActivity() {

    private lateinit var binding: ActivityRegistroprofesBinding
    private lateinit var firebaseAuth: FirebaseAuth

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityRegistroprofesBinding.inflate(layoutInflater)
        setContentView(binding.root)

        firebaseAuth = FirebaseAuth.getInstance()

        binding.osesion.setOnClickListener{
            val intent = Intent(this, ActivityUsuarioProfesores::class.java)
            startActivity(intent)
        }



        binding.bregistro.setOnClickListener{
            val email = binding.emailetc.text.toString()
            val pass = binding.passET.text.toString()
            val confirmPass = binding.confirmPassEt.text.toString()


            if(email.isNotEmpty() && pass.isNotEmpty() && confirmPass.isNotEmpty() ){
                if (pass == confirmPass){
                    firebaseAuth.createUserWithEmailAndPassword(email,pass).addOnCompleteListener{
                        if(it.isSuccessful){
                            val intent = Intent(this, ActivityUsuarioProfesores::class.java)
                            startActivity(intent)
                            Toast.makeText(baseContext,"Cuenta creada correctamente!",Toast.LENGTH_SHORT).show()

                        }else{
                            Toast.makeText(baseContext,"Correo o Contraseña Inválidas!",Toast.LENGTH_SHORT).show()
                        }

                    }

                }else{
                    Toast.makeText(this,"La contraseña no coincide",Toast.LENGTH_SHORT).show()
                }

            } else{
                Toast.makeText(this,"Los campos están vacios",Toast.LENGTH_SHORT).show()


            }



        }


    }
}