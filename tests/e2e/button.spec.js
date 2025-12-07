import { test, expect } from "@playwright/test";

test.beforeEach(async ({ page }) => {
});

test("ui-button renders on the page", async ({ page }) => {
  
});

test("ui-button handles disabled state", async ({ page }) => {
  await expect(button).toBeDisabled();
});
