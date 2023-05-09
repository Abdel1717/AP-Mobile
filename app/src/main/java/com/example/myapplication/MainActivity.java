package com.example.myapplication;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        //----------------------------------------------------------------
        // Gestion du bouton BtnMajeur associé à la ressource btnMajeur
        //----------------------------------------------------------------
        Button btnMajeur = (Button) findViewById(R.id.btnMajeur);
        //Utilisation d'un Listener [interface de gestion d'événements] pour récupérer l'interaction avec le bouton
        btnMajeur.setOnClickListener(new Button.OnClickListener() {
            @Override
            public void onClick(View arg0) {
                // Créarion d'un alertDialog
                final AlertDialog.Builder alertDialog = new AlertDialog.Builder(MainActivity.this);
                alertDialog.setTitle("Majeur");
                alertDialog.setMessage("Vous voulez acceder a la catégorie Majeur ?");

                alertDialog.setPositiveButton("Oui", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface arg0, int arg1) {
                        Toast.makeText(getApplicationContext(), btnMajeur.getText(), Toast.LENGTH_LONG).show();
                        Intent intent = new Intent(MainActivity.this, Majeur.class);
                        startActivity(intent);
                    }
                });

                alertDialog.setNegativeButton("Non", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface arg0, int arg1) {

                    }
                });
                alertDialog.show();
            }
            
        });

        Button btnJunior = (Button) findViewById(R.id.btnJunior);

        btnJunior.setOnClickListener(new Button.OnClickListener() {
            @Override
            public void onClick(View arg0) {
                // Créarion d'un alertDialog
                final AlertDialog.Builder alertDialog = new AlertDialog.Builder(MainActivity.this);
                alertDialog.setTitle("Junior");
                alertDialog.setMessage("Vous voulez acceder a la catégorie Junior ?");

                alertDialog.setPositiveButton("Oui", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface arg0, int arg1) {
                        Toast.makeText(getApplicationContext(), btnJunior.getText(), Toast.LENGTH_LONG).show();
                        Intent intent = new Intent(MainActivity.this, Junior.class);
                        startActivity(intent);
                    }
                });

                alertDialog.setNegativeButton("Non", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface arg0, int arg1) {

                    }
                });
                alertDialog.show();
            }
        });

        Button btnSenior = (Button) findViewById(R.id.btnSenior);

        btnSenior.setOnClickListener(new Button.OnClickListener() {
            @Override
            public void onClick(View arg0) {
                // Créarion d'un alertDialog
                final AlertDialog.Builder alertDialog = new AlertDialog.Builder(MainActivity.this);
                alertDialog.setTitle("Senior");
                alertDialog.setMessage("Vous voulez acceder a la catégorie Senior ?");

                alertDialog.setPositiveButton("Oui", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface arg0, int arg1) {
                        Toast.makeText(getApplicationContext(), btnSenior.getText(), Toast.LENGTH_LONG).show();
                        Intent intent = new Intent(MainActivity.this, Senior.class);
                        startActivity(intent);
                    }
                });

                alertDialog.setNegativeButton("Non", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface arg0, int arg1) {

                    }
                });
                alertDialog.show();
            }
        });

        Button btnProfessionnel = (Button) findViewById(R.id.btnProfessionnel);

        btnProfessionnel.setOnClickListener(new Button.OnClickListener() {
            @Override
            public void onClick(View arg0) {
                // Créarion d'un alertDialog
                final AlertDialog.Builder alertDialog = new AlertDialog.Builder(MainActivity.this);
                alertDialog.setTitle("Professionnel");
                alertDialog.setMessage("Vous voulez acceder a la catégorie Professionnel ?");

                alertDialog.setPositiveButton("Oui", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface arg0, int arg1) {
                        Toast.makeText(getApplicationContext(), btnProfessionnel.getText(), Toast.LENGTH_LONG).show();
                        Intent intent = new Intent(MainActivity.this, Professionnel.class);
                        startActivity(intent);
                    }
                });

                alertDialog.setNegativeButton("Non", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface arg0, int arg1) {

                    }
                });
                alertDialog.show();
            }
        });

    }

    //Menu
     @Override
    public boolean onCreateOptionsMenu(Menu menu) {
         MenuInflater inflater = getMenuInflater();
         inflater.inflate(R.menu.menugeneral, menu);
         return true;
     }

     // Activation des menus et sous menus
    public boolean onOptionsItemSelected(MenuItem item)
    {
        Toast.makeText(this, item.getTitle(), Toast.LENGTH_SHORT).show();

        switch (item.getItemId())
        {
            case R.id.menuRecherche:
                Log.i( "My Application", "Menu:Rechercher un joueur");
                return true;

            case R.id.menuReserver:
                Log.i( "My Application", "Menu:Reserver");
                return true;

            case R.id.menuEvenement:
                Log.i( "My Application", "Menu:Evenement");
                return true;

            case R.id.menuContact:
                Log.i( "My Application", "Menu:Contact");
                return true;
        }
        return true;
    }

}