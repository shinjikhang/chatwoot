<script setup>
import { computed } from 'vue';
import { useI18n } from 'vue-i18n';
import ButtonV4 from 'next/button/Button.vue';

const props = defineProps({
  isSuperAdmin: {
    type: Boolean,
    default: false,
  },
  isOnChatwootCloud: {
    type: Boolean,
    default: false,
  },
});

const emit = defineEmits(['upgrade']);

const { t } = useI18n();

const showUpgradeButton = computed(() => {
  return props.isOnChatwootCloud || props.isSuperAdmin;
});
</script>

<template>
  <div class="flex flex-col items-center justify-center p-8 text-center">
    <div class="mb-4">
      <fluent-icon icon="lock" size="48px" class="text-n-slate-11" />
    </div>
    <h3 class="mb-2 text-lg font-semibold text-n-slate-12">
      {{ t('SLA.PAYWALL.TITLE') }}
    </h3>
    <p class="mb-6 text-sm text-n-slate-11 max-w-md">
      {{ t('SLA.PAYWALL.DESCRIPTION') }}
    </p>
    <ButtonV4
      v-if="showUpgradeButton"
      solid
      blue
      :label="t('SLA.PAYWALL.UPGRADE')"
      @click="emit('upgrade')"
    />
  </div>
</template>
