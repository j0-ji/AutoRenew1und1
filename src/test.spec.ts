import { config } from 'dotenv';
config({ path: '.env' });

import { chromium } from 'playwright';
import {test} from '@playwright/test';

const url = process.env.URL || '';

test.describe('Automatically book another GB', async () => {
    const browser = await chromium.launch();
    const page = await browser.newPage();

    console.log('Step 1: go to page...');
    await page.goto(url);
    await page.waitForLoadState('domcontentloaded', {timeout: 30000});
    await page.screenshot({ path: './screenshots/01_go_to_page.png' });

    console.log('Step 2: accept cookies...');
    await page.click('#consent_wall_optin', { timeout: 20000 });
    await page.screenshot({ path: './screenshots/02_accept_cookies.png' });

    console.log('Step 3: get 1GB volume...');
    await page.getByTestId('+1 GB').click({timeout: 10000});
    await page.screenshot({ path: './screenshots/03_get_volume.png' });
});