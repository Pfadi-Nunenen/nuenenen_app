<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-title>Home</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content :fullscreen="true">
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">Home</ion-title>
        </ion-toolbar>
      </ion-header>

      <div class="ion-text-center">
        <h1>Pfadi Nünenen</h1>
        <br />

        <p>
          Wilkommen in der neuen App der Pfadi Nünenen. <br />
          Momentan können im Menüpunkt 'Stufen' die Kastenzettel der Stufen abgerufen werden. <br />
          Daneben kann in den Einstellungen festgelegt werden, von welchen Stufen Push-Benachrichtigungen empfangen werden sollen. <br />
        </p>
      </div>
    </ion-content>
  </ion-page>
</template>

<script setup lang="ts">
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent } from '@ionic/vue';
import ExploreContainer from '@/components/ExploreContainer.vue';
</script>

<style scoped>

</style>
