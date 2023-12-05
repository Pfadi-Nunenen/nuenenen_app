<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-title>Stufen</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content :fullscreen="true">
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">Stufen</ion-title>
        </ion-toolbar>
      </ion-header>
      <br />
      <div class="ion-text-center">
        <ion-button class="stufen-button">Biberstein</ion-button>
        <br />
        <br />
        <ion-button class="stufen-button">Phönix</ion-button>
        <br />
        <br />
        <ion-button class="stufen-button">Pfadis (Saturn & Aetna)</ion-button>
      </div>
    </ion-content>
  </ion-page>
</template>

<script setup lang="ts">
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent } from '@ionic/vue';
import ExploreContainer from '@/components/ExploreContainer.vue';
</script>

<style scoped>
.stufen-button {
  width: 90%;
}
</style>
