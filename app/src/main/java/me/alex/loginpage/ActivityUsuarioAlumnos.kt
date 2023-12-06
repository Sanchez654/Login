package me.alex.loginpage

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.ImageView
import android.widget.Toast
import androidx.core.text.isDigitsOnly
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.JsonObjectRequest
import com.android.volley.toolbox.Volley
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.storage.FirebaseStorage
import com.squareup.picasso.Picasso
import org.json.JSONObject

class ActivityUsuarioAlumnos : AppCompatActivity() {

    private lateinit var firebaseAuth: FirebaseAuth
    private lateinit var storage: FirebaseStorage
    private lateinit var ImageUri: Uri
    private lateinit var ivPhoto: ImageView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_ualumnos)

        firebaseAuth = FirebaseAuth.getInstance()
        storage = FirebaseStorage.getInstance()

        // ImageView
        ivPhoto = findViewById(R.id.ivPhoto)

        // EditTexts
        val itNombre: EditText = findViewById(R.id.etNombre)
        val itEdad: EditText = findViewById(R.id.etEdad)
        val itApellido: EditText = findViewById(R.id.etApellido)
        val itResidencia: EditText = findViewById(R.id.etResidencia)

        // Buttons
        val bSelec: Button = findViewById(R.id.bseleccionarImagen)

        val bEnviar: Button = findViewById(R.id.bEnviar)

        bSelec.setOnClickListener {
            seleccionarImage()
        }

        bEnviar.setOnClickListener {
            // Obtenemos el UUID desde el registro de usuario en Firebase
            val alumnoid = firebaseAuth.currentUser?.uid

            val nombre = itNombre.text.toString()

            val edad = itEdad.text.toString()

            val apellido = itApellido.text.toString()

            val residencia = itResidencia.text.toString()


            val url = "http://10.200.30.186/teacherfind/guardarUsuarioAlumno.php"


            val jsonObject = JSONObject()
            jsonObject.put("alumno_id", alumnoid)
            jsonObject.put("nombre", nombre)
            jsonObject.put("edad", edad)
            jsonObject.put("apellido", apellido)
            jsonObject.put("lugar_residencia", residencia)

            if(nombre.isNotEmpty() && edad.isNotEmpty() && apellido.isNotEmpty() && residencia.isNotEmpty()){
                val intent = Intent(this, MainActivitySesion::class.java)
                startActivity(intent)
            }else{
                Toast.makeText(this,"La campos dene llenarse",Toast.LENGTH_SHORT).show()

            }


            val request = object : JsonObjectRequest(
                Request.Method.PUT,
                url, jsonObject,
                Response.Listener { response ->
                },
                Response.ErrorListener { error ->
                    Log.e("App no jaló", error.message.toString())
                }
            ) {

            }

            Volley.newRequestQueue(this).add(request)
        }
    }

    private fun guardarImagen() {

        val maxWidth = 500
        val maxHeight = 500

        val id_user = firebaseAuth.currentUser?.uid

        // Guardar imagen con nombre del archivo
        val file = storage.getReference().child("images/$id_user/" + "foto")

        file.putFile(ImageUri).addOnCompleteListener {

            //Carga Terminada
            file.downloadUrl.addOnCompleteListener { uri ->

                // Url Disponible

                val url: String = uri.result.toString()

                Picasso.get()
                    .load(url)
                    .resize(maxWidth, maxHeight)
                    .centerCrop()
                    .into(ivPhoto)
            }
        }
    }

    private fun seleccionarImage() {
        val intent = Intent()
        intent.type = "image/*"
        intent.action = Intent.ACTION_GET_CONTENT
        startActivityForResult(intent, 100)

    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == 100 && resultCode == RESULT_OK) {
            ImageUri = data?.data!!

            // Después de seleccionar la imagen, llamar a guardarImagen()
            guardarImagen()
        }
    }
}
